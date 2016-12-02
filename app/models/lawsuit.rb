class Lawsuit < ApplicationRecord
  belongs_to :subcategory_id
  belongs_to :webresource_id
  validates_presence_of :name, :message => 'Field is required'
  validates_numericality_of :weight
end