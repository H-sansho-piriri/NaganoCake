class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_products = CartProduct.all
    @shipping_fee = 800
    @total = 0

    @cart_products.each do |cart_product|
      @total += cart_product.subtotal
    end

    if params[:order][:address_number] == "1"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name

    elsif params[:order][:address_number] == "2"

      @order = Order.new(order_params)
      @address = Shipping.find(params[:order][:shipping_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_number] == "3"

      @order = Order.new(order_params)
      # @order.postal_code = @address.postal_code
      # @order.address = @address.address
      # @order.name = @address.name
    end
  end

  def create
  end

  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
