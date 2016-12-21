class LawsuitBlocksController < ApplicationController
  before_action :authenticate_user!

  # GET /lawsuit_blocks/1
  def index
    @lawsuit_id = params[:id]
    @block_groups = BlockGroup.sorted
  end
  # POST /lawsuit_blocks/action
  def action
    process_lawsuit_block_action
  end
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
      elsif  data[:type] == 'remove'
        LawsuitBlock.delete_all(lawsuit_id: data[:lawsuit_id], block_id: data[:block_id])
      end
    end
end
