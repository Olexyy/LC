class LawsuitBlock < ApplicationRecord
  belongs_to :lawsuit
  belongs_to :block
  validates_numericality_of :weight

  def self.of_lawsuit(lawsuit_id)
    self.where(lawsuit_id: lawsuit_id).sort_by { |i| i.weight }
  end

  def self.normalise_weights(lawsuit_id)
    self.of_lawsuit(lawsuit_id).each_with_index do |element, index|
      element.update weight: index
    end
  end

  def self.json_fetch(lawsuit_id)
    lawsuit_blocks = LawsuitBlock.of_lawsuit(lawsuit_id)
    lawsuit_blocks.collect! { |i| {id: i.block.id, name: i.block.name}  }
  end

  def self.json_fetch_parts(block_id)
    block_parts = BlockPart.of_block block_id
    block_parts.collect! { |i| {id: i.id, name: i.name}  }
  end

end
