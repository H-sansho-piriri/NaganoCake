class Public::CartProductsController < ApplicationController
  def index
    @cart_product =
    @cart_products = CartProduct.all
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

private
def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
end


end

