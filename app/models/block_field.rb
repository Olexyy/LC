class BlockField < ApplicationRecord
  include ActiveModel::Validations
  validates_presence_of :name
  validates_presence_of :text
<<<<<<< HEAD
  # todo test
  validates_uniqueness_of :marker, conditions: -> { where.not(data_type: I18n.t(:condition)) }
  
=======
>>>>>>> 42fd85e88b6917e3f5e3582a03ecf3f51b0fe67e
  validates_numericality_of :weight
  validate :conditional_validation

  # for conditional blocks! ref to block that depends on field!
  has_many :blocks
  has_many :block_field_block_parts
  has_many :block_parts, through: :block_field_block_parts

  enum data_type: [I18n.t(:text), I18n.t(:number), I18n.t(:money), I18n.t(:condition)]
  validates :data_type, inclusion: { in: data_types }

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

  # need do for all and for conditional only
  def self.select_list_conditional
    list = self.where(data_type: I18n.t(:condition)).sort_by { |i| i.weight }
    list.collect { |i| [ i.name, i.id ] }
  end

  # need do for all and for non conditional only
  def self.select_list_non_conditional
    list = self.where.not(data_type: I18n.t(:condition)).sort_by { |i| i.weight }
    list.collect { |i| [ i.name, i.id ] }
  end

  def conditional_validation
    errors.add(:marker, I18n.t(:field_is_required)) if marker_not_set?
  end

  def marker_not_set?
    self.data_type != I18n.t(:condition) && self.marker.blank?
  end

end
