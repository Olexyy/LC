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

  def self.weights_sort(data)
    target_weight = LawsuitBlock.where(lawsuit_id: data[:lawsuit_id], block_id: data[:target_block_id]).first.weight
    block_weight = LawsuitBlock.where(lawsuit_id: data[:lawsuit_id], block_id: data[:block_id]).first.weight
    down = target_weight > block_weight
    and_next = false
    LawsuitBlock.of_lawsuit(params[:lawsuit_id]).each_with_index do |element, index|
      if down
        if element.weight == block_weight
          and_next = true
          element.update weight: target_weight
        elsif element.weight == target_weight
          element.update weight: index-1
          break
        elsif and_next
          element.update weight: index-1
        end
      else
        if element.weight == target_weight
          and_next = true
          element.update weight: index+1
        elsif element.weight == block_weight
          element.update weight: target_weight
          break
        elsif and_next
          element.update weight: index+1
        end
      end
    end
  end

end
