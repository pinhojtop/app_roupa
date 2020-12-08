class ReviewsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_rent, only: %i[new create]

  def new
    @review = Review.new
    @review.rent = @rent
  end

  def create
    @review = Review.new(review_params)
    # we need `rent_id` to associate review with corresponding rent
    @review.rent = @rent

    authorize @review

    if @review.save
      redirect_to rent_path(@rent)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])

    authorize @review

    @review.destroy

    redirect_to offer_path(@review.rent.offer)
  end

  private

    def set_rent
      @rent = Rent.find(params[:Rent_id])
    end

    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
