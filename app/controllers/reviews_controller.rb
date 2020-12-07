class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @offer = Offer.find(params[:offer_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `offer_id` to associate review with corresponding offer
    @offer = Offer.find(params[:offer_id])
    @review.offer = @offer
    if @review.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to offer_path(@review.offer)
  end

  private

    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
