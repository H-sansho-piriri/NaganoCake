class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "ジャンルを追加したよ。"
      redirect_to admin_categories_path
    else
      flash[:alert] = "もう一度入力してね。"
      @categories = Category.all
      render :index
    end

  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "ジャンルを編集したよ。"
      redirect_to admin_categories_path
    else
      flash[:alert] = "もう一度入力してね。"
      render :edit
    end
  end

private
  def category_params
    params.require(:category).permit(:name)
  end

end