class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    # TODO
  end

  def edit
    # TODO
  end
end
