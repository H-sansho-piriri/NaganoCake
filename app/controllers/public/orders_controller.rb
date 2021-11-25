class Public::OrdersController < ApplicationController
  
  before_action :authenticate_customer!
  
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
    cart_products = current_customer.cart_products.all
    @order = current_customer.orders.new(order_params)


    @shipping_fee = 800
    @total = 0
    cart_products.each do |cart_product|
      @total += cart_product.subtotal
    end

    @order.postage = @shipping_fee
    @order.total_price = @total

    @order.save
    cart_products.each do |cart|
      order_detail = OrderDetail.new
      order_detail.product_id = cart.product_id
      order_detail.order_id = @order.id
      order_detail.quantity = cart.quantity
      order_detail.price = cart.product.add_tax_price
      order_detail.save
    end

    redirect_to complete_orders_path
    cart_products.destroy_all

  end


  def complete
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @orders = OrderDetail.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
