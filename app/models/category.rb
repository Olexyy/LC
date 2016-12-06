class Category < ApplicationRecord
  has_many :subcategories
  validates_presence_of :name, :message => I18n.t(:field_is_required)
  validates_numericality_of :weight
end
