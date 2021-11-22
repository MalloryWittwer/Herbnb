class MowersController < ApplicationController
  def index
    @mowers = Mower.all
  end

  def new
    @mower = Mower.new
  end

  def create
    @mower = mower.new(mower_params)
    @mower.save ? redirect_to mowers_path : render :new
  end

  private

  def mower_params
    params.require(:mower).permit(:price_per_day, :title, :description)
  end
end
