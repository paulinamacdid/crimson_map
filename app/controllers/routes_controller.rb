class RoutesController < ApplicationController
  def show
    @facility = Facility.find(params[:facility_id])
  end

  def create
    @facility = Facility.find(params[:facility_id])
    @route = Route.new
    @route.facility = @facility
    @route.user = current_user

    @marker = [{
      lat: @facility.latitude,
      lng: @facility.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { facility: @facility }),
      marker_html: render_to_string(partial: "marker", locals: { facility: @facility })
    }]
    end
end
