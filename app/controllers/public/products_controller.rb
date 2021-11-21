class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
    @categories = Category.all
  end

  def show
  end
end
