class CategoryController < ApplicationController
  layout 'standard'

  def list
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to :action => 'show', :id => @category
    else
      render :action => 'edit'
    end
  end

  def delete
    Category.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def category_params
    params.require(:category).permit(:name, :weight)
  end
end
