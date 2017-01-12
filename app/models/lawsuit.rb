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
    markers = fields.collect { |i| !i.marker.blank? i.marker }
    fields.each do |i|
      if i.conditional
        i.conditional_fields.each.reject! { |y| markers.include? y.marker }
      end
    end
  end

  def render_final_text (fields)
    text = self.text
    fields.each { |i| text.gsub! '#'+i.marker, i.value }
    text
  end

end