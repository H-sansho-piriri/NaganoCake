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
    @order_details.each do |product|
      @total += product.price * product.quantity
    end
  end
  
  def confirm
  end

end
