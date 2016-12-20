class BlockSubgroup < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :weight
  validates_presence_of :block_group_id

  belongs_to :block_group
  has_many :blocks

  def self.sorted
    self.all.sort_by { |i| i.weight }
  end

  def self.select_list
    list = self.sorted
    list.collect { |i| [ i.name, i.id ] }
  end
end
