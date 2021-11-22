class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer)
  end

  def edit
    @customer = Customer.find(current_customer)
  end
  
  def update
    @cutomer = Customer.find(current_user)
    if @customer.update(customer_params)
      redirect_to cutomers_path(current_customer)
    else
      render :edit
    end
  end

  def unsubscribe
  end

　def withdrawal
　end
end
