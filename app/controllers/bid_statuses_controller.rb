class BidStatusesController < ApplicationController
  before_action :set_bid_status, only: [:show, :edit, :update, :destroy]

  # GET /bid_statuses
  def index
    @pagy, @bid_statuses = pagy(BidStatus.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @bid_statuses.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @bid_statuses.load
  end

  # GET /bid_statuses/1
  def show
  end

  # GET /bid_statuses/new
  def new
    @bid_status = BidStatus.new
  end

  # GET /bid_statuses/1/edit
  def edit
  end

  # POST /bid_statuses
  def create
    @bid_status = BidStatus.new(bid_status_params)

    if @bid_status.save
      redirect_to @bid_status, notice: "Bid status was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bid_statuses/1
  def update
    if @bid_status.update(bid_status_params)
      redirect_to @bid_status, notice: "Bid status was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bid_statuses/1
  def destroy
    @bid_status.destroy
    redirect_to bid_statuses_url, notice: "Bid status was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bid_status
    @bid_status = BidStatus.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bid_status_params
    params.require(:bid_status).permit(:name)
  end
end
