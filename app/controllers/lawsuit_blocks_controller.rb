class LawsuitBlocksController < ApplicationController
  before_action :authenticate_user!

  # GET /lawsuit_blocks/1
  def index
    @lawsuit = Lawsuit.where(id: params[:id]).first
    @block_groups = BlockGroup.sorted
  end
  # POST /lawsuit_blocks/action
  def action
    process_lawsuit_block_action
  end
  # POST /lawsuit_blocks/selected
  def selected
    lawsuit_blocks = LawsuitBlock.sorted(params[:lawsuit_id])
    lawsuit_blocks.collect! { |i| {id: i.block.id, name: i.block.name}  }
    render json: lawsuit_blocks, status: :ok
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def lawsuit_block_params
      params.permit(:type, :lawsuit_id, :block_id, :target_block_id)
    end

    def process_lawsuit_block_action
      data = lawsuit_block_params
      if data[:type] == 'add'
        LawsuitBlock.create(lawsuit_id: data[:lawsuit_id], block_id: data[:block_id])
      elsif data[:type] == 'remove'
        LawsuitBlock.delete_all(lawsuit_id: data[:lawsuit_id], block_id: data[:block_id])
      elsif data[:type] == 'move'
        normalise_weights
        target_weight = LawsuitBlock.where(lawsuit_id: data[:lawsuit_id], block_id: data[:target_block_id]).first.weight
        block_weight = LawsuitBlock.where(lawsuit_id: data[:lawsuit_id], block_id: data[:block_id]).first.weight
        down = target_weight > block_weight
        and_next = false
        LawsuitBlock.sorted(params[:lawsuit_id]).each_with_index do |element, index|
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
              element.update weight: index-1
            end
          end
        end
      end
    end

    def normalise_weights
      LawsuitBlock.sorted(params[:lawsuit_id]).each_with_index do |element, index|
        element.update weight: index
      end
    end

end