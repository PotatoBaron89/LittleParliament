class Api::V1::FoodsController < ApplicationController
  before_action :set_api_v1_food, only: %i[ show edit update destroy ]

  # GET /api/v1/foods or /api/v1/foods.json
  def index
    @api_v1_foods = Api::V1::Food.all
  end

  # GET /api/v1/foods/1 or /api/v1/foods/1.json
  def show
  end

  # GET /api/v1/foods/new
  def new
    @api_v1_food = Api::V1::Food.new
  end

  # GET /api/v1/foods/1/edit
  def edit
  end

  # POST /api/v1/foods or /api/v1/foods.json
  def create
    @api_v1_food = Api::V1::Food.new(api_v1_food_params)

    respond_to do |format|
      if @api_v1_food.save
        format.html { redirect_to api_v1_food_url(@api_v1_food), notice: "Food was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/foods/1 or /api/v1/foods/1.json
  def update
    respond_to do |format|
      if @api_v1_food.update(api_v1_food_params)
        format.html { redirect_to api_v1_food_url(@api_v1_food), notice: "Food was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/foods/1 or /api/v1/foods/1.json
  def destroy
    @api_v1_food.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_foods_url, notice: "Food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_food
      @api_v1_food = Api::V1::Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_food_params
      params.fetch(:api_v1_food, {})
    end
end
