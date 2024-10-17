class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @facilities = Facility.all
    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window_html: render_to_string(partial: "facilities/info_window", locals: { facility: facility }),
        marker_html: render_to_string(partial: "facilities/marker", locals: { facility:  facility })
      }
    end
    Facility.near('London, NE, UK')
    # add line of code that only pulls facilities that are a rating 4 and above
  end

  def landing_page
  end
end
