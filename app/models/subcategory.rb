class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :lawsuits
  validates_presence_of :name, :message => 'Field is required'
  validates_numericality_of :weight
end
