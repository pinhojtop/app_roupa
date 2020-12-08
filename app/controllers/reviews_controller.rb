class ReviewsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_rent, only: %i[new create]

  def new
    @review = Review.new
    @review.rent = @rent

    authorize @review
  end

  def create
    @review = Review.new(review_params)
    # we need `rent_id` to associate review with corresponding rent
    @review.rent = @rent

    authorize @review

    if @review.save
      redirect_to my_rents_path, notice: 'Avaliação criada com sucesso.'
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])

    authorize @review

    @review.destroy

    redirect_to offer_path(@review.rent.offer), notice: 'Avaliação apagada com sucesso.'
  end

  private

    def set_rent
      @rent = Rent.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
