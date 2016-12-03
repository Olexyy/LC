class LawsuitBlocksController < ApplicationController
  before_action :set_lawsuit_block, only: [:show, :edit, :update, :destroy]

  # GET /lawsuit_blocks
  # GET /lawsuit_blocks.json
  def index
    @lawsuit_blocks = LawsuitBlock.all
  end

  # GET /lawsuit_blocks/1
  # GET /lawsuit_blocks/1.json
  def show
  end

  # GET /lawsuit_blocks/new
  def new
    @lawsuit_block = LawsuitBlock.new
  end

  # GET /lawsuit_blocks/1/edit
  def edit
  end

  # POST /lawsuit_blocks
  # POST /lawsuit_blocks.json
  def create
    @lawsuit_block = LawsuitBlock.new(lawsuit_block_params)

    respond_to do |format|
      if @lawsuit_block.save
        format.html { redirect_to @lawsuit_block, notice: 'Lawsuit block was successfully created.' }
        format.json { render :show, status: :created, location: @lawsuit_block }
      else
        format.html { render :new }
        format.json { render json: @lawsuit_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lawsuit_blocks/1
  # PATCH/PUT /lawsuit_blocks/1.json
  def update
    respond_to do |format|
      if @lawsuit_block.update(lawsuit_block_params)
        format.html { redirect_to @lawsuit_block, notice: 'Lawsuit block was successfully updated.' }
        format.json { render :show, status: :ok, location: @lawsuit_block }
      else
        format.html { render :edit }
        format.json { render json: @lawsuit_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lawsuit_blocks/1
  # DELETE /lawsuit_blocks/1.json
  def destroy
    @lawsuit_block.destroy
    respond_to do |format|
      format.html { redirect_to lawsuit_blocks_url, notice: 'Lawsuit block was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lawsuit_block
      @lawsuit_block = LawsuitBlock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lawsuit_block_params
      params.require(:lawsuit_block).permit(:weight, :lawsuit_id, :block_id)
    end
end
