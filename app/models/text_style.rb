class TextStyle < ApplicationRecord
  validates_presence_of :name, :message => 'Field is required'
  validates_numericality_of :weight
  validates_numericality_of :tag
  validates_numericality_of :margin_left
  validates_numericality_of :text_align
  has_many :block_parts
end
