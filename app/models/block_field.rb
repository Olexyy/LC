class BlockField < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :text
  # todo test
  validates_uniqueness_of :marker, conditions: -> { where.not(data_type: I18n.t(:condition)) }
  
  validates_numericality_of :weight
  # validates :data_type, inclusion: { in: data_types }
  # for conditional blocks! ref to block that depends on field!
  has_many :blocks
  has_many :block_field_block_parts
  has_many :block_parts, through: :block_field_block_parts

  enum data_type: [I18n.t(:text), I18n.t(:number), I18n.t(:money), I18n.t(:condition)]

  def self.data_types_list
    self.data_types.keys.to_a
  end

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
