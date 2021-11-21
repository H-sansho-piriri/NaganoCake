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
    redirect_to admin_product_path(product.id)
  end

  def show
  end

  def edit
  end

  private
  def product_params
    params.require(:product).permit(:name, :caption, :price, :image, :is_active)
  end

end
