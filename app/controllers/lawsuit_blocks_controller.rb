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
    @block = Block.where(id: params[:id]).first
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