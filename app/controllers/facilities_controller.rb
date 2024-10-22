class FacilitiesController < ApplicationController
  def index
    @facility = Facility.new
    @facilities = Facility.all
    @markers = @facilities.geocoded.map do |facility|
      {
        toilet: facility.toilet,
        sanitary_products: facility.sanitary_products,
        baby_change: facility.baby_change,
        quiet_place: facility.quiet_place,
        education: facility.education,
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
    @reviews = @facility.reviews
    if !@reviews.empty?
      @ratings = @reviews.map{|review| review.rating}
      @average = (@ratings.sum / @ratings.count).floor(1)
    end
    # geocoded_facility = @facility.geocode
    @marker = [{
      lat: @facility.latitude,
      lng: @facility.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { facility: @facility }),
      marker_html: render_to_string(partial: "marker", locals: { facility: @facility })
    }]
  end

  def new
    @facility = Facility.new
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
