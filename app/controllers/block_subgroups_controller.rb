class BlockSubgroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_block_subgroup, only: [:show, :edit, :update, :destroy]

  # GET /block_subgroups
  def index
    @block_subgroups = BlockSubgroup.all
  end

  # GET /block_subgroups/1
  def show
  end

  # GET /block_subgroups/new
  def new
    @block_subgroup = BlockSubgroup.new
  end

  # GET /block_subgroups/1/edit
  def edit
  end

  # POST /block_subgroups
  def create
    @block_subgroup = BlockSubgroup.new(block_subgroup_params)

    respond_to do |format|
      if @block_subgroup.save
        format.html { redirect_to @block_subgroup, notice: t(:operation_successful) }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /block_subgroups/1
  def update
    respond_to do |format|
      if @block_subgroup.update(block_subgroup_params)
        format.html { redirect_to @block_subgroup, notice: t(:operation_successful) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /block_subgroups/1
  def destroy
    @block_subgroup.destroy
    respond_to do |format|
      format.html { redirect_to block_subgroups_url, notice: t(:operation_successful) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block_subgroup
      @block_subgroup = BlockSubgroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_subgroup_params
      params.require(:block_subgroup).permit(:name, :weight, :block_group_id)
    end
end
