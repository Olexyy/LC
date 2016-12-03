class Block < ApplicationRecord
  belongs_to :block_field
  belongs_to :block_group
  validates_presence_of :name, :message => "Field is required"
  validates_presence_of :marker, :message => "Field is required"
  validates_numericality_of :weight
  validates_numericality_of :include_type
  validates_numericality_of :content_type
  has_many :block_parts
  has_many :lawsuit_blocks
  has_many :lawsuits, :through => :lawsuit_blocks
end
