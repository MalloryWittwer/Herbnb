class MowersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    nearby_users = find_nearby_users
    @mowers = find_local_mowers(nearby_users)
    @markers = markers_of_nearby_users(nearby_users)
  end

  def new
    @mower = Mower.new
    @user = current_user
  end

  def create
    @mower = Mower.new(mower_params)
    @mower.user = current_user
    @mower.save ? redirect_to(user_path(@mower.user)) : (render :new)
  end

  def edit
    @mower = Mower.find(params[:id])
  end

  def update
    @mower = Mower.find(params[:id])
    @mower.update(mower_params)

    redirect_to(user_path(@mower.user))
  end

  def show
    @mower = Mower.find(params[:id])
    @booking = Booking.new
    @user = @mower.user
    @marker = @user.geocoded? ? [{ lat: @user.latitude, lng: @user.longitude, image_url: helpers.asset_url("lawn-mower.png") }] : []
  end

  def destroy
    @mower = Mower.find(params[:id])
    @mower.destroy
    redirect_to user_path(current_user)
  end

  private

  def mower_params
    params.require(:mower).permit(:price_per_day, :title, :description, :photo)
  end

  def find_nearby_users
    if params[:query].present?
      map_center = Geocoder.search(params[:query]).first.coordinates
      nearby_users = User.near(map_center, params[:distance].to_f)  # Finds only 4 users instead of 6 even 200 km of Lausanne...
    else
      nearby_users = User.all
    end
    nearby_users
  end

  def find_local_mowers(nearby_users)
    # Unpacks all mowers of nearby users in an array (could be made more efficient)
    all_mowers = []
    nearby_users.each do |user|
      user.mowers.each do |mower|
        all_mowers << mower
      end
    end
    all_mowers
  end

  def markers_of_nearby_users(nearby_users)
    nearby_users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url("lawn-mower.png")
      }
    end
  end
end
