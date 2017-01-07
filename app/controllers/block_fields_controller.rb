class BlockFieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_block_field, only: [:show, :edit, :update, :destroy]

  # GET /block_fields
  def index
    @block_fields = BlockField.all
  end

  # GET /block_fields/1
  def show
  end

  # GET /block_fields/new
  def new
    @block_field = BlockField.new
  end

  # GET /block_fields/1/edit
  def edit
  end

  # POST /block_fields
  def create
    @block_field = BlockField.new(block_field_params)

    respond_to do |format|
      if @block_field.save
        format.html { redirect_to @block_field, notice: t(:operation_successful) }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /block_fields/1
  def update
    respond_to do |format|
      if @block_field.update(block_field_params)
        format.html { redirect_to @block_field, notice: t(:operation_successful) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /block_fields/1
  def destroy
    @block_field.destroy
    respond_to do |format|
      format.html { redirect_to block_fields_url, notice: t(:operation_successful) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block_field
      @block_field = BlockField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_field_params
      params.require(:block_field).permit(:name, :text, :weight, :data_type, :marker)
    end
end