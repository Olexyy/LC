class WebResource < ApplicationRecord
  has_many :lawsuits
  validates_presence_of :name, :message => 'Field is required'
  validates_presence_of :body, :message => 'Field is required'
  validates_numericality_of :weight
end
