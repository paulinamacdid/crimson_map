class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user.current_lat.present?
      @facilities = Facility.near([current_user.current_lat, current_user.current_long], 10)
    else
    @facilities = Facility.all
    end
    @facilities.order(rating: :desc)
    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window_html: render_to_string(partial: "facilities/info_window", locals: { facility: }),
        marker_html: render_to_string(partial: "facilities/marker", locals: { facility: })
      }
    end
    # Facility.near('London, NE, UK')

    # add line of code that only pulls facilities that are a rating 4 and above
    # @facilities = Facility.near(current_user.geocode, 5)
    # @markers = @facilities.geocoded.map do |facility|
    #   {
    #     lat: facility.latitude,
    #     lng: facility.longitude,
    #     info_window_html: render_to_string(partial: "facilities/info_window", locals: { facility: }),
    #     marker_html: render_to_string(partial: "facilities/marker", locals: { facility: })
    #   }
    # end
  end

  def landing_page
  end

  def my_profile
    @review = Review.where(user: current_user)
    @facility = Facility.where(user: current_user)
  end
end
