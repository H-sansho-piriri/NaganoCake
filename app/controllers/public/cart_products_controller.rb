class Public::CartProductsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_products = CartProduct.all
    @total = 0
    @order = Order.new
    # @cart_products.all.sum(:quantity)

    # @products = CartProduct.all
  end

  def create
    # binding.pry
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id

    # もしカート内に同じ商品があったら
    if current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id]).present?
      @cart_product = current_customer.cart_products.find_by(product_id: params[:cart_product][:product_id])
      @cart_product.quantity += params[:cart_product][:quantity].to_i
      @cart_product.save
      redirect_to customers_cart_products_path
    # なかったら
    else
      @cart_product.save
      flash[:notice] = "買ってくれるかな？"
      redirect_to customers_cart_products_path
    end

  end

  # カート内の個数を変更
  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update(cart_product_params)
      flash[:notice] = "変更できたよ。"
      redirect_to customers_cart_products_path
    else
      @cart_products = CartProduct.all
      flash[:alert] = "申し訳ございません。キャパオーバーです。"
      render :index
    end
  end



  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    flash[:alert] = "買わないんですか、、？"
    redirect_to customers_cart_products_path
  end

  def destroy_all
    @cart_products = CartProduct.all
    @cart_products.destroy_all
    flash[:alert] = "ぴえん"
    redirect_to customers_cart_products_path
  end


#product_idとquantityを取り出し格納するため
  private

  def cart_product_params
      params.require(:cart_product).permit(:product_id, :quantity)
  end

end
