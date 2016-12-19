class Block < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :block_group
  validates_presence_of :name
  validates_numericality_of :weight
  validate :conditional_validation

  # validates_numericality_of :include_type // should validate automatically
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

  def conditional_validation
    errors.add(:block_field_id, I18n.t(:field_is_required)) if conditional_fail?
  end

  def conditional_fail?
    (Block.include_types[self.include_type] === Block.include_types[I18n.t(:conditional)]) && self.block_field_id.blank?
  end

end
