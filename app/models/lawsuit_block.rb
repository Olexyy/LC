class LawsuitBlock < ApplicationRecord
  belongs_to :lawsuit
  belongs_to :block
  validates_numericality_of :weight

  def self.sorted(lawsuit_id)
    self.where(lawsuit_id: lawsuit_id).sort_by { |i| i.weight }
  end

end
