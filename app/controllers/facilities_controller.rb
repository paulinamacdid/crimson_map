class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {facility: facility})
      }
    end
  end

  def show
    @facility = Facility.find(params[:id])
    @review = Review.new
  end
end
