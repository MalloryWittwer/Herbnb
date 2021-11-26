class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @all_bookings =  Booking.joins(:mower).where(mowers: {user: @user})
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
