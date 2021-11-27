class Public::ProductsController < ApplicationController
  before_action :authenticate_customer!
  # before_action :customer_sign_in?

  def index
    @products = Product.page(params[:page]).per(8)
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end

#   private
#   def customer_sign_in?
#     unless customer.sign_in?
#       redirect_to root_path
#     end
#   end
end