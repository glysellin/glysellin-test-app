class UsersController < ApplicationController
  def show
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
