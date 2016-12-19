class BlockPart < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :weight
  validates_presence_of :text
  validates_presence_of :block

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

end