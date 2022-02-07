class Api::V1::DrinksController < ApplicationController
  before_action :set_api_v1_drink, only: %i[ show edit update destroy ]

  # GET /api/v1/drinks or /api/v1/drinks.json
  def index
    @api_v1_drinks = Api::V1::Drink.all
  end

  # GET /api/v1/drinks/1 or /api/v1/drinks/1.json
  def show
  end

  # GET /api/v1/drinks/new
  def new
    @api_v1_drink = Api::V1::Drink.new
  end

  # GET /api/v1/drinks/1/edit
  def edit
  end

  # POST /api/v1/drinks or /api/v1/drinks.json
  def create
    @api_v1_drink = Api::V1::Drink.new(api_v1_drink_params)

    respond_to do |format|
      if @api_v1_drink.save
        format.html { redirect_to api_v1_drink_url(@api_v1_drink), notice: "Drink was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_drink }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/drinks/1 or /api/v1/drinks/1.json
  def update
    respond_to do |format|
      if @api_v1_drink.update(api_v1_drink_params)
        format.html { redirect_to api_v1_drink_url(@api_v1_drink), notice: "Drink was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_drink }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/drinks/1 or /api/v1/drinks/1.json
  def destroy
    @api_v1_drink.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_drinks_url, notice: "Drink was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_drink
      @api_v1_drink = Api::V1::Drink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_drink_params
      params.fetch(:api_v1_drink, {})
    end
end
