class OffersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[index show]

  before_action :set_offer, only: %i[show edit update destroy]

  # GET /offers
  def index
    @offers = policy_scope(Offer)
  end

  # GET /offers/1
  def show
    @offer = Offer.find(params[:id])
    @rent = Rent.new
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    authorize @offer
  end

  # GET /offers/1/edit
  def edit; end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer

    if @offer.save
      redirect_to offer_path(@offer), notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /offers/1
  def update
    if @offer.update(offer_params)
      redirect_to @offer, notice: 'Offer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /offers/1
  def destroy
    @offer.destroy
    redirect_to offers_url, notice: 'Offer was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  # Only allow a trusted parameter "white list" through.
  def offer_params
    params.require(:offer).permit(:id, :name, :description, :offer_type, :size, :gender, :style, :price_per_day)
  end
end
