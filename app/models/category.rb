class Category < ApplicationRecord
  has_many :subcategories
  validates_presence_of :name, :message => "Field is required"
  validates_numericality_of :weight
end
