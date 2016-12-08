class LawsuitsController < ApplicationController
  before_action :set_lawsuit, only: [:show, :edit, :update, :destroy]

  # GET /lawsuits
  def index
    @lawsuits = Lawsuit.all
  end

  # GET /lawsuits/1
  def show
  end

  # GET /lawsuits/new
  def new
    @lawsuit = Lawsuit.new
  end

  # POST /lawsuits
  def create
    @lawsuit = Lawsuit.new(lawsuit_params)

    respond_to do |format|
      if @lawsuit.save
        format.html { redirect_to @lawsuit, notice: t(:operation_successful) }
      else
        format.html { render :new }
      end
    end
  end

  # GET /lawsuits/1/edit
  def edit
  end

  # PATCH/PUT /lawsuits/1
  def update
    respond_to do |format|
      if @lawsuit.update(lawsuit_params)
        format.html { redirect_to @lawsuit, notice: t(:operation_successful) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /lawsuits/1
  def destroy
    @lawsuit.destroy
    respond_to do |format|
      format.html { redirect_to lawsuits_url, notice: t(:operation_successful) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lawsuit
      @lawsuit = Lawsuit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lawsuit_params
      params.require(:lawsuit).permit(:name, :weight, :subcategory_id, :web_resource_id)
    end
end
