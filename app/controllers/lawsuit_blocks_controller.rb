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
=begin
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
=end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def lawsuit_block_params
      params.permit(:type, :lawsuit_id, :block_id, :target_block_id)
    end

    def process_lawsuit_block_action
      data = lawsuit_block_params
      if data[:type] == 'add'
        LawsuitBlock.create(lawsuit_id: data[:lawsuit_id], block_id: data[:block_id])
      end
    end
end
