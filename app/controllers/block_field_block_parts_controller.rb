class BlockFieldBlockPartsController < ApplicationController
  before_action :set_block_field_block_part, only: [:show, :edit, :update, :destroy]

  # GET /block_field_block_parts
  # GET /block_field_block_parts.json
  def index
    @block_field_block_parts = BlockFieldBlockPart.all
  end

  # GET /block_field_block_parts/1
  # GET /block_field_block_parts/1.json
  def show
  end

  # GET /block_field_block_parts/new
  def new
    @block_field_block_part = BlockFieldBlockPart.new
  end

  # GET /block_field_block_parts/1/edit
  def edit
  end

  # POST /block_field_block_parts
  # POST /block_field_block_parts.json
  def create
    @block_field_block_part = BlockFieldBlockPart.new(block_field_block_part_params)

    respond_to do |format|
      if @block_field_block_part.save
        format.html { redirect_to @block_field_block_part, notice: 'Block field block part was successfully created.' }
        format.json { render :show, status: :created, location: @block_field_block_part }
      else
        format.html { render :new }
        format.json { render json: @block_field_block_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /block_field_block_parts/1
  # PATCH/PUT /block_field_block_parts/1.json
  def update
    respond_to do |format|
      if @block_field_block_part.update(block_field_block_part_params)
        format.html { redirect_to @block_field_block_part, notice: 'Block field block part was successfully updated.' }
        format.json { render :show, status: :ok, location: @block_field_block_part }
      else
        format.html { render :edit }
        format.json { render json: @block_field_block_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /block_field_block_parts/1
  # DELETE /block_field_block_parts/1.json
  def destroy
    @block_field_block_part.destroy
    respond_to do |format|
      format.html { redirect_to block_field_block_parts_url, notice: 'Block field block part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block_field_block_part
      @block_field_block_part = BlockFieldBlockPart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_field_block_part_params
      params.require(:block_field_block_part).permit(:block_field_id, :block_part_id)
    end
end
