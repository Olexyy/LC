class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]

  # GET /subcategories
  def index
    @subcategories = Subcategory.sorted
  end

  # GET /subcategories/1
  def show
  end

  # GET /subcategories/new
  def new
    @subcategory = Subcategory.new
  end

  # POST /subcategories
  def create
    @subcategory = Subcategory.new(subcategory_params)
    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to subcategory_url(@subcategory), notice: t(:operation_successful) }
      else
        format.html { render :new }
      end
    end
  end

  # GET /subcategories/1/edit
  def edit
  end

  # PATCH/PUT /subcategories/1
  def update
    respond_to do |format|
      if @subcategory.update(subcategory_params)
        format.html { redirect_to subcategory_url(@subcategory), notice: t(:operation_successful) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /subcategories/1
  def destroy
    @subcategory.destroy
    respond_to do |format|
      format.html { redirect_to subcategories_url, notice: t(:operation_successful) }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    def subcategory_params
      params.require(:subcategory).permit(:name, :weight, :category_id)
    end

end
