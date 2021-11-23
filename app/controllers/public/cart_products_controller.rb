class Public::CartProductsController < ApplicationController
  def index
    @cart_products = CartProduct.all

    # @products = CartProduct.all
  end

  def create
    # binding.pry
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    # if
    @cart_product.save
    redirect_to customers_cart_products_path
    # else
    # render:index
    # end
    # @cart_product.customer = current_customer
    # @cart_product.product.id = params[:product_id]
    # @task = Task.new(task_params)
    # @cart_products = CartProduct.all
    # @cart_product = CartProduct.find(cart_product_params[:product_id])
    # @cart_product.save
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

#product_idとquantityを取り出し格納するため
private
def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
end


end

