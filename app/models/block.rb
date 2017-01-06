class Block < ApplicationRecord
  include ActiveModel::Validations

  validates_presence_of :name
  validates_presence_of :block_subgroup_id
  validates_numericality_of :weight
  validate :conditional_validation

  belongs_to :block_subgroup
  #we should take in account this ref + belonging to lawsuit
  belongs_to :block_field, optional: true
  has_many :lawsuit_blocks
  has_many :lawsuits, through: :lawsuit_blocks
  has_many :block_parts

  enum include_type: [I18n.t(:automatic), I18n.t(:conditional)]

  def self.include_types_list
    self.include_types.keys.to_a
  end

  def self.sorted
    self.all.sort_by { |i| i.weight }
  end

  def self.select_list
    list = self.sorted
    list.collect { |i| [ i.name, i.id ] }
  end

  def conditional_validation
    errors.add(:block_field_id, I18n.t(:field_is_required)) if conditional_fail?
  end

  def conditional_fail?
    (Block.include_types[self.include_type] === Block.include_types[I18n.t(:conditional)]) && self.block_field_id.blank?
  end

  def text
    block_parts = self.block_parts.sort_by { |i| i.weight }
    block_parts.collect {|i| [i.text.html_safe] }.join(' ')
  end

  def self.text(block_id)
    block_parts = self.find(block_id).block_parts.sort_by { |i| i.weight }
    block_parts.collect {|i| [i.text.html_safe] }.join(' ')
  end

end
