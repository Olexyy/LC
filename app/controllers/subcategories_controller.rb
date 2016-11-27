class SubcategoriesController < ApplicationController
  layout 'standard'

  def list
    @subcategories = Subcategory.all
  end

  def show
    @subcategory = Subcategory.find(params[:id])
  end

  def new
    @subcategory = Subcategory.new
    @categories = Category.all
  end

  def create
    @subcategory = Subcategory.new(subcategories_params)
    if @subcategory.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
    @categories = Category.all
  end

  def update
    @subcategory = Subcategory.find(params[:id])
    if @subcategory.update_attributes(subcategories_params)
      redirect_to :action => 'show', :id => @subcategory
    else
      render :action => 'edit'
    end
  end

  def delete
    Subcategory.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def subcategories_params
    params.require(:subcategories).permit(:name, :weight, :category_id)
  end
end
