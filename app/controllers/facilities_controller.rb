class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { facility: facility }),
        marker_html: render_to_string(partial: "marker", locals: { facility: facility })
        # info_window_html: render_to_string(partial: "info_window", locals: { facility: }),
        # marker_html: render_to_string(partial: "marker", locals: { facility: })
      }
    end
  end

  def show
    @facilities = Facility.all
    @facility = Facility.find(params[:id])
    @review = Review.new
    # geocoded_facility = @facility.geocode
    @marker = [{
      lat: @facility.latitude,
      lng: @facility.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { facility: @facility }),
      marker_html: render_to_string(partial: "marker", locals: { facility: @facility })
    }]
  end
end
