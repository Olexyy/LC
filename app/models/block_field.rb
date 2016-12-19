class BlockField < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :text
  validates_presence_of :marker
  validates_numericality_of :weight
  validates_numericality_of :data_type #BOOL conditional
  #validates :size, inclusion: { in: sizes.keys }
  # for conditional blocks! ref to block that depends on field!
  has_many :blocks
  has_many :block_field_block_parts
  has_many :block_parts, through: :block_field_block_parts
  # todo: translate
  enum data_type: [:text, :number, :money, :condition]

  def self.sorted
    self.all.sort_by { |i| i.weight }
  end

  def self.select_list
    list = self.sorted
    list.collect { |i| [ i.name, i.id ] }
  end

  # need do for all and for bool only
  def self.select_list_conditional
    list = self.where(data_type: :condition).sort_by { |i| i.weight }
    list.collect { |i| [ i.name, i.id ] }
  end

end
