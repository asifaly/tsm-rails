class OffersController < ApplicationController
  before_action :set_offer, only: %i[show edit update destroy]

  # GET /offers
  def index
    @pagyc, @offers = pagy(Offer.where(account: current_account)
                        .sort_by_params(params[:sort], sort_direction))
    @pagyr, @received_offers = pagy(Offer.where.not(account: current_account)
                                .sort_by_params(params[:sort], sort_direction))
    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @offers.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @offers.load
    @received_offers.load
  end

  # GET /offers/1
  def show
    @owner = current_account == @offer.account
    @bids = if @owner
              @offer.bids.where(bid_status_id: 3).includes(%i[account base_rate bid_status rich_text_conditions])
            else
              @offer.bids.where(account: current_account).includes(%i[base_rate bid_status])
            end
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit; end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)
    @offer.account = current_account

    if @offer.save
      redirect_to @offer, notice: 'Offer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /offers/1
  def update
    if @offer.update(offer_params)
      redirect_to @offer, notice: 'Offer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
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
  end

  # Only allow a trusted parameter "white list" through.
  def offer_params
    params.require(:offer).permit(:account_id, :product_id, :currency_id, :transaction_amount, :percentage_sold,
                                  :disclosed, :open_offer, :risk_sold_amount, :fixed_rate, :base_rate_id, :spread, :valid_until, :underlying_contract_details, :goods_description, :expiry_date, :tenor_days, :place_of_taking_incharge, :port_of_loading, :port_of_discharge, :final_destination)
  end
end
