class UsersController < ApplicationController
  def show
    @orders = current_user.orders.includes(:items, :billing_address, :shipping_address).
      where('glysellin_orders.state IN (?)', %w(payment_method_chosen paid shipped))
  end

  def edit
  end

  def update
    if current_user.update_attributes(params[:user])
      flash[:notice] = 'User updated'
    else
      flash[:error] = 'Failed to update user'
    end
    
    redirect_to edit_user_path
  end
end
