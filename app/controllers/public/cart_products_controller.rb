class Public::CartProductsController < ApplicationController
  def index
    @cart_products = CartProduct.all
    @total = 0
    # @cart_products.all.sum(:quantity)

    # @products = CartProduct.all
  end

  def create
    # binding.pry
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id

    # もしカート内に同じ商品があったら
    if current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id]).present?
      cart_product = current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id])
      cart_product.quantity += params[:cart_product][:quantity].to_i
      cart_product.save
      redirect_to customers_cart_products_path
    # なかったら
    else
      @cart_product.save
      redirect_to customers_cart_products_path
    end

  end

  # カート内の個数を変更
  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(cart_product_params)
    redirect_to customers_cart_products_path
  end



  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to customers_cart_products_path
  end

  def destroy_all
    @cart_products = CartProduct.all
    @cart_products.destroy_all
    redirect_to customers_cart_products_path
  end


#product_idとquantityを取り出し格納するため
private
def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
end


end

