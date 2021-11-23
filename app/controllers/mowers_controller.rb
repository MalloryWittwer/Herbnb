class MowersController < ApplicationController
  def index
    @mowers = Mower.all
  end

  def new
    @mower = Mower.new
  end

  def create
    @mower = mower.new(mower_params)
    @mower.save
    redirect_to mowers_path(mower.id)
  end

  def edit
    # TODO
  end

  def update
    # TODO
  end

  def show
    # TODO
  end

  def destroy
    # TODO
  end

  private

  def mower_params
    params.require(:mower).permit(:price_per_day, :title, :description, :photo)
  end
end
