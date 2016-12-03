class BlockFieldsController < ApplicationController
  before_action :set_block_field, only: [:show, :edit, :update, :destroy]

  # GET /block_fields
  # GET /block_fields.json
  def index
    @block_fields = BlockField.all
  end

  # GET /block_fields/1
  # GET /block_fields/1.json
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
  # POST /block_fields.json
  def create
    @block_field = BlockField.new(block_field_params)

    respond_to do |format|
      if @block_field.save
        format.html { redirect_to @block_field, notice: 'Block field was successfully created.' }
        format.json { render :show, status: :created, location: @block_field }
      else
        format.html { render :new }
        format.json { render json: @block_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /block_fields/1
  # PATCH/PUT /block_fields/1.json
  def update
    respond_to do |format|
      if @block_field.update(block_field_params)
        format.html { redirect_to @block_field, notice: 'Block field was successfully updated.' }
        format.json { render :show, status: :ok, location: @block_field }
      else
        format.html { render :edit }
        format.json { render json: @block_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /block_fields/1
  # DELETE /block_fields/1.json
  def destroy
    @block_field.destroy
    respond_to do |format|
      format.html { redirect_to block_fields_url, notice: 'Block field was successfully destroyed.' }
      format.json { head :no_content }
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
