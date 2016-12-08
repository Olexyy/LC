class Lawsuit < ApplicationRecord
  belongs_to :subcategory
  belongs_to :web_resource, optional: true
  has_many :lawsuit_blocks
  has_many :blocks, through: :lawsuit_blocks
  validates_presence_of :name
  validates_presence_of :subcategory_id
  validates_numericality_of :weight

  def self.sorted
    self.all.sort_by { |i| i.weight }
  end

  def self.select_list
    list = self.sorted
    list.collect { |i| [ i.name, i.id ] }
  end
end