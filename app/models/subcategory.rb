class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :lawsuits
  validates_presence_of :name
  validates_presence_of :category_id
  validates_numericality_of :weight

  def self.sorted
    self.all.sort_by { |i| i.weight }
  end

  def self.select_list
    list = self.sorted
    list.collect { |i| [ i.name, i.id ] }
  end
end
