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
    params[:facility][:toilet] == "1" ? params[:facility][:toilet] = true : params[:facility][:toilet] = false
    params[:facility][:sanitary_products] == "1" ? params[:facility][:sanitary_products] = true : params[:facility][:sanitary_products] = false
    params[:facility][:baby_change] == "1" ? params[:facility][:baby_change] = true : params[:facility][:baby_change] = false
    params[:facility][:quiet_place] == "1" ? params[:facility][:quiet_place] = true : params[:facility][:quiet_place] = false
    params[:facility][:education] == "1" ? params[:facility][:education] = true : params[:facility][:education] = false
    @facility = Facility.new(facility_params)
    @facility.user = current_user
    if  @facility.save
      redirect_to facility_path(@facility)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :address, :toilet, :sanitary_products, :baby_change, :quiet_place, :education, :opening_hours, :photo)
  end
end
