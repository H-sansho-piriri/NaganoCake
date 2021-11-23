class Public::CustomersController < ApplicationController
  
  def show
   @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to cutomers_path(current_customer)
    else
      render :edit
    end
  end

  def unsubscribe
  end
  
  def withdraw
    @customer = current_customer
    @customer.is_deleted = true
    @customer.save
    redirect_to root_path
  end

end
