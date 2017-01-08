class BlockPartsController < ApplicationController
  include AJAX
  before_action :authenticate_user!
  before_action :set_block_part, only: [ :show, :edit, :edit_alter, :update_alter, :update, :destroy, :destroy_alter ]

  # GET /block_parts
  def index
    @block_parts = BlockPart.sorted
  end

  # GET /block_parts/1
  def show
  end

  # GET /block_parts/new
  def new
    @block_part = BlockPart.new
  end

  # GET /block_parts/new/1
  def new_alter
    session[:return_to_block_part] = request.referer
    @block_part = BlockPart.new
    @block_part.block_id = params[:id]
  end

  # GET /block_parts/1/edit
  def edit
  end

  # GET /block_parts/edit/1
  def edit_alter
    session[:return_to_block_part] = request.referer
  end

  # POST /block_parts
  def create
    @block_part = BlockPart.new(block_part_params)

    respond_to do |format|
      if @block_part.save
        format.html { redirect_to @block_part, notice: t(:operation_successful)}
      else
        format.html { render :new }
      end
    end
  end

  # POST /block_parts/edit/1
  def create_alter
    @block_part = BlockPart.new(block_part_params)

    respond_to do |format|
      if @block_part.save
        @block_part.add_fields
        format.html { redirect_to session.delete(:return_to_block_part), notice: t(:operation_successful) }
      else
        format.html { render :new_alter }
      end
    end
  end

  # PATCH/PUT /block_parts/1
  def update
    respond_to do |format|
      if @block_part.update(block_part_params)
        format.html { redirect_to @block_part, notice: t(:operation_successful) }
      else
        format.html { render :edit }
      end
    end
  end

  # PATCH/PUT /block_parts/1
  def update_alter
    respond_to do |format|
      if @block_part.update(block_part_params)
        format.html { redirect_to session.delete(:return_to_block_part), notice: t(:operation_successful) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /block_parts/1
  def destroy
    @block_part.destroy
    respond_to do |format|
      format.html { redirect_to block_parts_url, notice: t(:operation_successful) }
    end
  end

  # DELETE /block_parts/delete/1
  def destroy_alter
    @block_part.destroy
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to_block_part), notice: t(:operation_successful) }
    end
  end

  # POST /block_parts/ajax
  def ajax
    command = params[:command]
    block_parts_sort if command == 'sort'
    block_parts_list if command == 'list'
    block_parts_text if command == 'text'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block_part
      @block_part = BlockPart.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def block_part_params
      params.require(:block_part).permit(:name, :text, :weight, :block_id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def block_part_params_ajax
      params.permit(:block_id, :source_part_id, :target_part_id)
    end

    def block_parts_list
      collection = ajax_draggable_list BlockPart.of_block(params[:block_id]), '/block_part/edit/'
      result = ajax_command 'replace_list', '#list' , collection
      render json: result, status: :ok
    end

    def block_parts_sort
      process_block_parts_sort
      render json: ajax_command('sorted'), status: :ok
    end

    def block_parts_text
      text = Block.text(params[:block_id])
      result = ajax_command 'replace_text', '.block-text' , text
      render json: result, status: :ok
    end

  def process_block_parts_sort
    data = block_part_params_ajax
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
