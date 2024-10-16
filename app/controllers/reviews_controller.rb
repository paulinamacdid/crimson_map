class ReviewsController < ApplicationController

  def new
    #@review = Review.new
  end

  def create
    @facility = Facility.find(params[:facility_id])
    @review = Review.new(review_params)
    @review.facility = @facility
    @review.user = current_user
    if @review.save
      flash.notice = "Review added!"
      redirect_to facility_path(@facility)
    else
      render "facilities/show", facility: @facility, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
