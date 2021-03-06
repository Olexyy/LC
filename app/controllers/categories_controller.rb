class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.sorted
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: t(:operation_successful) }
      else
        format.html { render :new }
      end
    end
  end

  # GET /categories/1/edit
  def edit
  end

  # PATCH/PUT /categories/1
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: t(:operation_successful) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: t(:operation_successful) }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :weight)
    end

end
