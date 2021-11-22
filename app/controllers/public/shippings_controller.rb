class Public::ShippingsController < ApplicationController
  def index
    @shipping = Shipping.new
    @shippings = Shipping.all
  end

  def create
    shipping = Shipping.new(shipping_params)
    shipping.save
    redirect_to customers_shippings_path
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      redirect_to customers_shippings_path
    else
      render :edit
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    redirect_to customers_shippings_path
  end

  private
  def shipping_params
    params.require(:shipping).permit(:name, :postal_code, :address, :customer_id)
  end
end
