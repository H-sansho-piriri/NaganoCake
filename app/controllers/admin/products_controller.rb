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
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(product.id)
    @categories = Category.all
  end

  private
  # category_id追加する
  def product_params
    params.require(:product).permit(:name, :caption, :price, :image, :category_id, :is_active)
  end

end
