class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
     product = Product.new(product_params)
     product.save
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  private
  def product_params
    params.require(:product).permit(:name, :caption, :price, :image, :is_active)
  end

end
