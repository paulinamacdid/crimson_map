class UsersController < ApplicationController
  def update
    current_user.update(current_lat: params[:current_lat], current_long: params[:current_long])
  end
end
