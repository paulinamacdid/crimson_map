class FacilitiesController < ApplicationController
  def index
    @facility = Facility.new

    if params[:query].present?
      case params[:query]
      when 'toilet'
        @facilities = Facility.where(toilet: true)
      when 'quiet_place'
        @facilities = Facility.where(quiet_place: true)
      when 'sanitary_products'
        @facilities = Facility.where(sanitary_products: true)
      when 'baby_change'
        @facilities = Facility.where(baby_change: true)
      when 'education'
        @facilities = Facility.where(education: true)
      end
    else
      @facilities = Facility.all
    end

    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { facility: }),
        marker_html: render_to_string(partial: "marker", locals: { facility: })
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

  def create
    @facility = Facility.new(facility_params)
    if  @facility.save
      redirect_to facility_path(@facility)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :address, :toilet, :sanitary_products, :baby_change, :quiet_place, :education, :opening_hours, :image)
  end
end
