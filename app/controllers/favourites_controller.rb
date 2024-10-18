class FavouritesController < ApplicationController
  def create
    @favourite = Favourite.new
    @user = current_user
    @favourite.user = @user
    if @favourite.save
      redirect_to facilities_path
    else
      @favourite = Favourite.new
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @favourites = Favourite.all
  end

  def update
  end
end
