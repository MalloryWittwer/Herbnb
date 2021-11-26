class BookingsController < ApplicationController
  def edit
    @booking = Booking.find(params[:id])
    @mower = @booking.mower
    @user = current_user
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to(user_path(@booking.user))
  end

  def new
    @mower = Mower.find(params[:mower_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @mower = Mower.find(params[:mower_id])
    @booking.mower = @mower
    @booking.user = current_user
    @booking.price = @mower.price_per_day * (@booking.return_date - @booking.pickup_date + 1)
    @booking.save ? (redirect_to user_path(@booking.user_id)) : (render :new)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to(user_path(@booking.user))
  end

  private

  def booking_params
    params.require(:booking).permit(:pickup_date, :return_date, :price)
  end
end
