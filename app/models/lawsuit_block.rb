class LawsuitBlock < ApplicationRecord
  belongs_to :lawsuit
  belongs_to :block
  validates_numericality_of :weight
end
