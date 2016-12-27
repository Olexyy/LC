class BlockPartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_block_part, only: [:show, :edit, :edit_simple, :update_simple, :update, :destroy]

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

  # GET /block_parts/1/edit
  def edit
  end

  # GET /block_parts/edit/1
  def edit_simple
    session[:return_to] ||= request.referer
  end

  # POST /block_parts
  # POST /block_parts.json
  def create
    @block_part = BlockPart.new(block_part_params)

    respond_to do |format|
      if @block_part.save
        format.html { redirect_to @block_part, notice: t(:operation_successful)}
        #format.json { render :show, status: :created, location: @block_part }
      else
        format.html { render :new }
        #format.json { render json: @block_part.errors, status: :unprocessable_entity }
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
  def update_simple
    respond_to do |format|
      if @block_part.update(block_part_params)
        format.html { redirect_to session.delete(:return_to), notice: t(:operation_successful) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /block_parts/1
  # DELETE /block_parts/1.json
  def destroy
    @block_part.destroy
    respond_to do |format|
      format.html { redirect_to block_parts_url, notice: t(:operation_successful) }
      #format.json { head :no_content }
    end
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
end
