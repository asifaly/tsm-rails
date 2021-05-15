class OfferStatusesController < ApplicationController
  before_action :set_offer_status, only: [:show, :edit, :update, :destroy]

  # GET /offer_statuses
  def index
    @pagy, @offer_statuses = pagy(OfferStatus.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @offer_statuses.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @offer_statuses.load
  end

  # GET /offer_statuses/1
  def show
  end

  # GET /offer_statuses/new
  def new
    @offer_status = OfferStatus.new
  end

  # GET /offer_statuses/1/edit
  def edit
  end

  # POST /offer_statuses
  def create
    @offer_status = OfferStatus.new(offer_status_params)

    if @offer_status.save
      redirect_to @offer_status, notice: "Offer status was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /offer_statuses/1
  def update
    if @offer_status.update(offer_status_params)
      redirect_to @offer_status, notice: "Offer status was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /offer_statuses/1
  def destroy
    @offer_status.destroy
    redirect_to offer_statuses_url, notice: "Offer status was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_offer_status
    @offer_status = OfferStatus.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def offer_status_params
    params.require(:offer_status).permit(:name)
  end
end
