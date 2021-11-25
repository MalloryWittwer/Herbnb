class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to(user_path(@booking.user))
  end

  def edit
    @user = User.find(params[:id])
  end
end
