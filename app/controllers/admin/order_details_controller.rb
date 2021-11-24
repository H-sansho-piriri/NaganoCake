class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_details_params)

    redirect_to request.referer
  end


  private
  def order_details_params
    params.require(:order_detail).permit(:making_status)
  end
end
