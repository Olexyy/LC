class LawsuitBlocksController < ApplicationController
  include AJAX
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
    lawsuit_blocks = LawsuitBlock.json_fetch params[:lawsuit_id]
    render json: lawsuit_blocks, status: :ok
  end
  # GET /lawsuit_blocks/1/edit
  def edit
    @block = Block.where(id: params[:id]).first
  end
  # POST /lawsuit_blocks/block_parts_load
  def block_parts_load
    collection = ajax_draggable_list BlockPart.of_block(params[:block_id]), '/block_part/edit/'
    result = ajax_command 'replace_draggable', '#list' , collection
    render json: result, status: :ok
  end
  # POST /lawsuit_blocks/block_parts_sort
  def block_parts_sort
    process_block_parts_sort
    render json: ajax_command('sorted'), status: :ok
  end
  # POST /lawsuit_blocks/block_parts_text
  def block_parts_text
    text = Block.text(params[:block_id])
    result = ajax_command 'replace_text', '.block-text' , text
    render json: result, status: :ok
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def lawsuit_block_params
      params.permit(:type, :lawsuit_id, :block_id, :target_block_id)
    end

    def block_parts_params
      params.permit(:block_id, :source_part_id, :target_part_id)
    end

    def process_lawsuit_block_action
      data = lawsuit_block_params
      if data[:type] == 'add'
        LawsuitBlock.create(lawsuit_id: data[:lawsuit_id], block_id: data[:block_id])
      elsif data[:type] == 'remove'
        LawsuitBlock.delete_all(lawsuit_id: data[:lawsuit_id], block_id: data[:block_id])
      elsif data[:type] == 'move'
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

  def process_block_parts_sort
    data = block_parts_params
    BlockPart.normalise_weights params[:block_id]
    target_weight = BlockPart.where(id: data[:target_part_id]).first.weight
    source_weight = BlockPart.where(id: data[:source_part_id]).first.weight
    down = target_weight > source_weight
    and_next = false
    BlockPart.of_block(params[:block_id]).each_with_index do |element, index|
      if down
        if element.weight == source_weight
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
        elsif element.weight == source_weight
          element.update weight: target_weight
          break
        elsif and_next
          element.update weight: index+1
        end
      end
    end
  end
end