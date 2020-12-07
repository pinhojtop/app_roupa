class RentsController < ApplicationController
  before_action :authenticate_user!

  # POST /rents
  def create
    @offer = Offer.find(params[:offer_id])
    @rent = Rent.new(rent_params)
    @rent.user = current_user
    @rent.offer = @offer
    authorize @rent

    datas_ocupadas = period_avaliable
    if datas_ocupadas.zero?
      if @rent.save
        redirect_to offer_path(@offer), notice: 'Rent was successfully created.'
      else
        redirect_to offer_path(@offer), notice: 'At least one invalid date'
      end
    else
      msg = datas_ocupadas == 1 ? "One date is not available" : "#{datas_ocupadas} dates are not available"
      redirect_to offer_path(@offer), notice: msg
    end
  end

  # DELETE /rents/1
  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy
    redirect_to offer_path(@rent.offer), notice: 'Rent was successfully destroyed.'
    authorize @rent
  end

  private

  # Only allow a trusted parameter "white list" through.
  def rent_params
    params.require(:rent).permit(:begin_date, :final_date)
  end

  def period_avaliable
    rents_offer = Rent.where(offer_id: @offer.id)
    bdate = @rent[:begin_date]
    edate = @rent[:final_date]
    datasocupadas = 0

    rents_offer.each do |rent|
      next unless rent.final_date >= Date.today

      (bdate..edate).each do |data|
        datasocupadas += 1 if (data >= rent.begin_date) && (data <= rent.final_date)
      end
    end
    return datasocupadas
  end
end
