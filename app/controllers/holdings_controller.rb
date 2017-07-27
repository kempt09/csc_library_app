class HoldingsController < ApplicationController
  before_action :set_holding, only: [:show, :update, :destroy]

  # GET /holdings
  def index
    @holdings = Holding.all

    render json: @holdings
  end

  # GET /holdings/1
  def show
    render json: @holding
  end

  # POST /holdings
  def create
    @holding = Holding.new(holding_params)

    if @holding.save
      render json: @holding, status: :created, location: @holding
    else
      render json: @holding.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holdings/1
  def update
    if @holding.update(holding_params)
      render json: @holding
    else
      render json: @holding.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holdings/1
  def destroy
    @holding.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holding
      @holding = Holding.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def holding_params
      params.require(:data).permit({attributes: [:title, :section, :created_at, :updated_at]})
    end
end
