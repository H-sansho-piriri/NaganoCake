class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
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
    @categories = Category.all
    @product = Product.find(params[:id])

  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admin_product_path(product.id)
  end

  private
  def product_params
    params.require(:product).permit(:name, :caption, :price, :image, :category_id, :is_active)
  end

end
