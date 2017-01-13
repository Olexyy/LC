class Lawsuit < ApplicationRecord
  belongs_to :subcategory
  belongs_to :web_resource, optional: true
  has_many :lawsuit_blocks
  has_many :blocks, through: :lawsuit_blocks
  validates_presence_of :name
  validates_presence_of :subcategory_id
  validates_numericality_of :weight

  def self.sorted
    self.all.sort_by { |i| i.weight }
  end

  def self.select_list
    list = self.sorted
    list.collect { |i| [ i.name, i.id ] }
  end

  def text
    lawsuit_blocks = self.lawsuit_blocks.sort_by { |i| i.weight }
    lawsuit_blocks.collect {|i| [i.block.text.html_safe] }.join(' ')
  end

  def conditional_text(fields)
    lawsuit_blocks = self.lawsuit_blocks.sort_by { |i| i.weight }
    excluded_block_ids = fields.collect { |f| f.block.id if f.conditional? and f.value != '1' }
    lawsuit_blocks = lawsuit_blocks.each.reject { |y| excluded_block_ids.include? y.block.id }
    lawsuit_blocks.collect {|i| [i.block.text.html_safe] }.join(' ')
  end

  def self.text(lawsuit_id)
    lawsuit_blocks = self.find(lawsuit_id).lawsuit_blocks.sort_by { |i| i.weight }
    lawsuit_blocks.collect {|i| [i.block.text.html_safe] }.join(' ')
  end

  def self.blocks_sorted(lawsuit_id)
    lawsuit_blocks = self.find(lawsuit_id).lawsuit_blocks.sort_by { |i| i.weight }
    lawsuit_blocks.collect! {|i| i.block }
    lawsuit_blocks
  end

  def fields
    fields = []
    Lawsuit.blocks_sorted(self.id).each { |block| fields += block.fields }
    fields.uniq! { |i| i.marker }
    # remove duplicates from conditional
    self.conditional_fields_uniq fields
    fields
  end

  def conditional_fields_uniq(fields)
    markers = fields.collect { |f| f.marker unless f.marker.blank? }
    fields.each do |i|
      if i.conditional?
        i.conditional_fields = i.conditional_fields.each.reject { |y| markers.include? y.marker }
      end
    end
  end

  def render_final_text (fields)
    text = self.conditional_text fields
    #TODO pass recursive TEST -> pass
    fields.each do |i|
      if not i.conditional?
        text.gsub! '#'+i.marker, i.value
      elsif i.conditional? and i.value == '1'
        i.conditional_fields.each { |y| text.gsub! '#'+y.marker, y.value }
      end
    end
    text
  end

end