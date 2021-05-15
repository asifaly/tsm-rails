class BaseProductsController < ApplicationController
  before_action :set_base_product, only: [:show, :edit, :update, :destroy]

  # GET /base_products
  def index
    @pagy, @base_products = pagy(BaseProduct.sort_by_params(params[:sort], sort_direction))

    # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
    # Calling @base_products.any? in the view will use the loaded records to check existence instead of making an extra DB call.
    @base_products.load
  end

  # GET /base_products/1
  def show
  end

  # GET /base_products/new
  def new
    @base_product = BaseProduct.new
  end

  # GET /base_products/1/edit
  def edit
  end

  # POST /base_products
  def create
    @base_product = BaseProduct.new(base_product_params)

    if @base_product.save
      redirect_to @base_product, notice: "Base product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /base_products/1
  def update
    if @base_product.update(base_product_params)
      redirect_to @base_product, notice: "Base product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /base_products/1
  def destroy
    @base_product.destroy
    redirect_to base_products_url, notice: "Base product was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_base_product
    @base_product = BaseProduct.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def base_product_params
    params.require(:base_product).permit(:description)
  end
end
