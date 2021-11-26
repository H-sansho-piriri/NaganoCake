class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_details_params)
    @order = @order_detail.order


    if @order_detail.making_status == "coming_soon"
      @order_detail.order.update(status: "making_now")

    elsif @order.order_details.where(making_status: "now_on_air").count == @order.order_details.count
      @order_detail.order.update(status: "preparing_delivery")

    end

    redirect_to request.referer
  end


  private
  def order_details_params
    params.require(:order_detail).permit(:making_status)
  end
end
