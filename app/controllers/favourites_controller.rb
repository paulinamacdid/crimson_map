class FavouritesController < ApplicationController
  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @facility = Facility.find(params[:facility_id])
    @favourite.facility = @facility
    if @favourite.save
      redirect_to home_path
    else
      @favourite = Favourite.new
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @favourites = Favourite.where(user: current_user)
  end

  def update
  end
end
