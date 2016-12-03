class BlockField < ApplicationRecord
  validates_presence_of :name, :message => "Field is required"
  validates_presence_of :text, :message => "Field is required"
  validates_presence_of :marker, :message => "Field is required"
  validates_numericality_of :weight
  validates_numericality_of :data_type
  has_many :blocks
end
