class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all

  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  def edit

  end

  def update
  end

private
  def category_params
    params.require(:category).permit(:name)
  end

end