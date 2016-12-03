class BlockGroup < ApplicationRecord
  validates_presence_of :name, :message => "Field is required"
  validates_numericality_of :weight
  has_many :blocks
end
