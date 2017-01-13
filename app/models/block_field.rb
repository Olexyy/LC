class BlockField < ApplicationRecord
  include ActiveModel::Validations
  attr_accessor :value
  attr_accessor :conditional_fields
  validates_presence_of :name
  validates_presence_of :text

  # todo test
  validates_uniqueness_of :marker, conditions: -> { where.not(data_type: I18n.t(:condition)) }

  validates_numericality_of :weight
  validate :conditional_validation

  # for conditional blocks! ref to block that depends on field!
  has_one :block
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

  def conditional?
    self.data_type == I18n.t(:condition)
  end

  def self.select_list_conditional
    list = self.where(data_type: I18n.t(:condition)).sort_by { |i| i.weight }
    list.collect { |i| [ i.name, i.id ] }
  end

  def self.non_conditional
    self.where.not(data_type: I18n.t(:condition)).sort_by { |i| i.weight }
  end

  def conditional_validation
    errors.add(:marker, I18n.t(:field_is_required)) if marker_not_set?
  end

  def marker_not_set?
    self.data_type != I18n.t(:condition) && self.marker.blank?
  end

  def self.fetch_and_fill(params)
    fields = []
    params.each do |key, value|
      block_field = self.where(id: value[:id]).first
      block_field.value = value[:value]
      fields << block_field
      #we add fields with markers only on condition TODO: test -> PASS
      if block_field.conditional? && block_field.value == '1'
        conditional_fields = []
        value[:fields].each do |sub_key, sub_value|
          sub_block_field = self.where(id: sub_value[:id]).first
          sub_block_field.value = sub_value[:value]
          conditional_fields << sub_block_field
        end
        block_field.conditional_fields = conditional_fields
      end
        fields << block_field
    end
    fields
  end

end
