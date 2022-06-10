class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to current_customer_path(@customer)
  end

  def withdrawal_confirm

  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: true)
    reset_session
    redirect_to
  end

  private

  def customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end
end
