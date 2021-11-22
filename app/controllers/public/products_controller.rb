class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
    @categories = Category.all
  end

  def show
    @categories = Category.all
    # @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end
end
