class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude
      }
    end
  end

  def show
    @facility = Facility.find(params[:id])
  end
end
