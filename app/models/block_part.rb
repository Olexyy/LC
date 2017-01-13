class BlockPart < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :weight
  validates_presence_of :text
  validates_presence_of :block
  validate :markers_validate

  belongs_to :block
  has_many :block_field_block_parts
  has_many :block_fields, through: :block_field_block_parts

  def self.sorted
    self.all.sort_by { |i| i.weight }
  end

  def self.select_list
    list = self.sorted
    list.collect { |i| [ i.name, i.id ] }
  end

  def self.of_block(block_id)
    self.where(block_id: block_id).sort_by { |i| i.weight }
  end

  def self.normalise_weights(block_id)
    self.of_block(block_id).each_with_index do |element, index|
      element.update weight: index
    end
  end
  
  def markers_validate
    self.errors.add(:marker, I18n.t(:use_only_defined_markers)) if markers_not_valid?
  end
  
  def markers_not_valid?
    self.markers.each do |marker|
      records = BlockField.where(marker: marker)
      return true if records.blank?
    end
    false
  end
  
  def add_fields
    markers = self.markers
    # add new ties fields -> parts
    markers.each do |marker|
      unless self.block_fields.any? {|i| i.marker == marker }
        block_field = BlockField.where(marker: marker).first
        BlockFieldBlockPart.create(block_part_id: self.id, block_field_id: block_field.id)
      end
    end
    #remove old ties fields -> markers
    self.block_fields.each do |block_field|
      unless markers.any? {|marker| marker == block_field.marker }
        BlockFieldBlockPart.delete_all(block_part_id: self.id, block_field_id: block_field.id)
      end
    end
  end

  def markers
    # http://rubular.com/, http://stackoverflow.com/questions/80357/match-all-occurrences-of-a-regex
    # we must have at least one symbol after '#' which breaks by any whitespace char, '&' or '<'
    markers = self.text.scan(/#[^<^\s^&]+/)
    markers.each {|i| i.sub! '#', '' }
  end

  def fields
    fields = []
    self.markers.each do |marker|
      fields << BlockField.where(marker: marker).first
    end
    fields.uniq { |i| i.marker }
  end

end