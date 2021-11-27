class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "登録情報を編集したよ。"
      redirect_to customers_path(current_customer)
    else
      flash[:alert] = "もう一度入力してね。"
      render :edit
    end
  end

  def unsubscribe
  end


  def withdraw
    customer = current_customer
    customer.update(is_deleted: true)
    reset_session
    flash[:alert] = "また会員登録してね！"
    redirect_to root_path
  end

private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end

end
