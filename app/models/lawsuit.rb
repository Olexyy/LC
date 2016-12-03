class Lawsuit < ApplicationRecord
  belongs_to :subcategory
  belongs_to :web_resource
  validates_presence_of :name, :message => 'Field is required'
  validates_numericality_of :weight
  has_many :lawsuit_blocks
  has_many :blocks, :through => :lawsuit_blocks
end