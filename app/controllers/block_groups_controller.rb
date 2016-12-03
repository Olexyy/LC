class BlockGroupsController < ApplicationController
  before_action :set_block_group, only: [:show, :edit, :update, :destroy]

  # GET /block_groups
  # GET /block_groups.json
  def index
    @block_groups = BlockGroup.all
  end

  # GET /block_groups/1
  # GET /block_groups/1.json
  def show
  end

  # GET /block_groups/new
  def new
    @block_group = BlockGroup.new
  end

  # GET /block_groups/1/edit
  def edit
  end

  # POST /block_groups
  # POST /block_groups.json
  def create
    @block_group = BlockGroup.new(block_group_params)

    respond_to do |format|
      if @block_group.save
        format.html { redirect_to @block_group, notice: 'Block group was successfully created.' }
        format.json { render :show, status: :created, location: @block_group }
      else
        format.html { render :new }
        format.json { render json: @block_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /block_groups/1
  # PATCH/PUT /block_groups/1.json
  def update
    respond_to do |format|
      if @block_group.update(block_group_params)
        format.html { redirect_to @block_group, notice: 'Block group was successfully updated.' }
        format.json { render :show, status: :ok, location: @block_group }
      else
        format.html { render :edit }
        format.json { render json: @block_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /block_groups/1
  # DELETE /block_groups/1.json
  def destroy
    @block_group.destroy
    respond_to do |format|
      format.html { redirect_to block_groups_url, notice: 'Block group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block_group
      @block_group = BlockGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_group_params
      params.require(:block_group).permit(:name, :weight)
    end
end
