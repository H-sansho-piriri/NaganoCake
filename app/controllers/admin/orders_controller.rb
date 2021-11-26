class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
    # これだと税抜？
    @order_details.each do |order_detail|
      @total += order_detail.product.add_tax_price * order_detail.quantity
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

    if @order.status == "payment_cofirm"
      @order.order_details.update(making_status: "wating")
    end

    redirect_to request.referer
  end


  private
  def order_params
    params.require(:order).permit(:status)
  end


end
