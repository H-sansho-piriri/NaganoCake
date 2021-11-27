class Public::ShippingsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @shipping = Shipping.new
    @shippings = current_customer.shippings.all
  end

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    if @shipping.save
      flash[:notice] = "配送先の登録ができたよ。"
      redirect_to customers_shippings_path
    else
      flash[:alert] = "もう一度入力してね。"
      @shippings = current_customer.shippings.all
      render :index
    end
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    @shipping.customer_id = current_customer.id
    if @shipping.update(shipping_params)
      flash[:notice] = "配送先情報を編集したよ。"
      redirect_to customers_shippings_path
    else
      flash[:alert] = "もう一度入力してね。"
      render :edit
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    flash[:notice] = "配送先情報を消したよ。"
    redirect_to customers_shippings_path
  end

  private
  def shipping_params
    params.require(:shipping).permit(:name, :postal_code, :address, :customer_id)
  end
end
