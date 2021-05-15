class BaseRatesController < ApplicationController
  before_action :set_base_rate, only: [:show, :edit, :update, :destroy]

  # GET /base_rates
  def index
    @pagy, @base_rates = pagy(BaseRate.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @base_rates.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @base_rates.load
  end

  # GET /base_rates/1
  def show
  end

  # GET /base_rates/new
  def new
    @base_rate = BaseRate.new
  end

  # GET /base_rates/1/edit
  def edit
  end

  # POST /base_rates
  def create
    @base_rate = BaseRate.new(base_rate_params)

    if @base_rate.save
      redirect_to @base_rate, notice: "Base rate was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /base_rates/1
  def update
    if @base_rate.update(base_rate_params)
      redirect_to @base_rate, notice: "Base rate was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /base_rates/1
  def destroy
    @base_rate.destroy
    redirect_to base_rates_url, notice: "Base rate was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_base_rate
    @base_rate = BaseRate.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def base_rate_params
    params.require(:base_rate).permit(:description)
  end
end
