class TextStyle < ApplicationRecord
  validates_presence_of :name, :message => 'Field is required'
  validates_numericality_of :weight
  validates_numericality_of :tag
  validates_numericality_of :margin_left
  validates_numericality_of :text_align
  has_many :block_parts
  #http://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html
  enum :tag => [ :div, :p, :h1, :h2, :h3, :h4, :h5 ]
  enum :margin_left => [ :undefined, :center, :header ]
  enum :text_align => [ :left, :right, :centered, :justify ]
end
