class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @facilities = Facility.all
    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window_html: render_to_string(partial: "facilities/info_window", locals: { facility: }),
        marker_html: render_to_string(partial: "facilities/marker", locals: { facility: })
      }
    end
    Facility.near('London, NE, UK')

    # add line of code that only pulls facilities that are a rating 4 and above
    # @facilities = Facility.near(current_user.geocode, 5)
    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window_html: render_to_string(partial: "facilities/info_window", locals: { facility: }),
        marker_html: render_to_string(partial: "facilities/marker", locals: { facility: })
      }
    end
  end

  def landing_page
  end
end
