class LawsuitBlocksController < ApplicationController
  include AJAX
  before_action :authenticate_user!

  # GET /lawsuit_blocks/lawsuit/1
  def lawsuit
    @lawsuit = Lawsuit.where(id: params[:id]).first
    session[:lawsuit_id] = @lawsuit.id
    @block_groups = BlockGroup.sorted
  end
  # GET /lawsuit_blocks/block/1
  def block
    @block = Block.where(id: params.require(:id)).first
  end
  def fields
    @lawsuit = Lawsuit.where(id: params.require(:id)).first
    @fields = @lawsuit.fields
  end
  # PATCH /lawsuit_blocks/fields_submit
  def fields_submit
    lawsuit = Lawsuit.where(id: params.require(:lawsuit)[:id]).first
    fields = BlockField.fetch_and_fill params.require(:fields)
    @text = lawsuit.render_final_text fields
  end
  # POST /lawsuit_blocks/ajax
  def ajax
    command = params[:command]
    block_parts_sort if command == 'sort'
    lawsuit_blocks_list if command == 'list'
    lawsuit_blocks_text if command == 'text'
    process_lawsuit_block_action if command == 'add' || command == 'move' || command == 'remove'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def lawsuit_block_params
      params.permit(:command, :lawsuit_id, :block_id, :target_block_id)
    end

    def process_lawsuit_block_action
      data = lawsuit_block_params
      if data[:command] == 'add'
        LawsuitBlock.create(lawsuit_id: data[:lawsuit_id], block_id: data[:block_id])
      elsif data[:command] == 'remove'
        LawsuitBlock.delete_all(lawsuit_id: data[:lawsuit_id], block_id: data[:block_id])
      elsif data[:command] == 'move'
        LawsuitBlock.normalise_weights params[:lawsuit_id]
        LawsuitBlock.weights_sort data
      end
    end

    def lawsuit_blocks_text
      text = Lawsuit.text(params[:lawsuit_id])
      result = ajax_command 'replace_text', '.lawsuit-text' , text
      render json: result, status: :ok
    end

    def lawsuit_blocks_list
      collection = ajax_draggable_list Lawsuit.blocks_sorted(params[:lawsuit_id]), '/lawsuit_blocks/block/'
      result = ajax_command 'replace_list', '#selected' , collection
      render json: result, status: :ok
    end

end