class TextStyle < ApplicationRecord

  validates_presence_of :name, :message => 'Field is required'
  validates_numericality_of :weight

  has_many :block_parts
  #http://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html
  enum :tag => [ :div, :p, :h1, :h2, :h3, :h4, :h5 ]
  enum :margin_left => [ I18n.t(:undefined), I18n.t(:center), I18n.t(:header) ]
  enum :text_align => [ I18n.t(:left), I18n.t(:right), I18n.t(:centered), I18n.t(:justify) ]
  def self.sorted
    self.all.sort_by { |i| i.weight }
  end

end
