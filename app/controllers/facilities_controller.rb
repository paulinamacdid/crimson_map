class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {facility: facility}),
        marker_html: render_to_string(partial: "marker", locals: {facility: facility})
      }
    end
  end

  def show
    @facility = Facility.find(params[:id])
    @review = Review.new
    geocoded_facility = @facility.geocode
    @marker = [{
        lat: geocoded_facility[0],
        lng: geocoded_facility[1],
        info_window_html: render_to_string(partial: "info_window", locals: {facility: @facility}),
        marker_html: render_to_string(partial: "marker", locals: {facility: @facility})
      }]
  end
end
