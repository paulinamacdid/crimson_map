class ReviewsController < ApplicationController
  def new
  end

  def create
    @facility = Facility.find(params[:facility_id])
    @review = Review.new(review_params)
    @review.facility = @facility
    if @review.save
      redirect_to car_path(@facility)
    else
      render "cars/show", status: :unprocessable_entity
    end
  end
end
