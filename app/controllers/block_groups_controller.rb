class BlockGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_block_group, only: [:show, :edit, :update, :destroy]

  # GET /block_groups
  def index
    @block_groups = BlockGroup.sorted
  end

  # GET /block_groups/1
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
  def create
    @block_group = BlockGroup.new(block_group_params)

    respond_to do |format|
      if @block_group.save
        format.html { redirect_to @block_group, notice: t(:operation_successful) }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /block_groups/1
  def update
    respond_to do |format|
      if @block_group.update(block_group_params)
        format.html { redirect_to @block_group, notice: t(:operation_successful)  }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /block_groups/1
  def destroy
    @block_group.destroy
    respond_to do |format|
      format.html { redirect_to block_groups_url, notice: t(:operation_successful)  }
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
