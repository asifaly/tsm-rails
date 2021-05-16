class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  # GET /bids
  def index
    @pagy, @bids = pagy(Bid.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @bids.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @bids.load
  end

  # GET /bids/1
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids
  def create
    @bid = Bid.new(bid_params)

    if @bid.save
      redirect_to @bid, notice: "Bid was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bids/1
  def update
    if @bid.update(bid_params)
      redirect_to @bid, notice: "Bid was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bids/1
  def destroy
    @bid.destroy
    redirect_to bids_url, notice: "Bid was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bid
    @bid = Bid.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bid_params
    params.require(:bid).permit(:offer_id, :account_id, :bid_amount, :bid_status_id, :base_rate_id, :rate, :spread, :bid_validity, :conditions)
  end
end