class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @order_detail.update(order_details_params)
    
    redirect_to request.referer
  end
  
  
  private
  def order_details_params
    params.require(:order_detail).permit(:making_status)
  end
end
