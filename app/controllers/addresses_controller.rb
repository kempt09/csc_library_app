class AddressesController < ApplicationController
  before_action :validate_user
  before_action :set_address, only: [:show, :update, :destroy]

  # GET /addresses
  def index
    @addresses = Address.includes(:customer).where(:admin_id => @current_user.id).paginate(page: page, per_page: per_page)
    render json: @addresses, include: ['customer']
  end

  # GET /addresses/1
  def show
    render json: @address, include: ['customer']
  end

  # POST /addresses
  def create
    @address = Address.new(address_params)
    @address.admin_id = @current_user.id

    if @address.save
      render json: @address, status: :created, location: @address
    else
      render json: {errors: @address.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      render json: @address
    else
      render json: {errors: @address.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.includes(:customer).where(:admin_id => @current_user.id, :id => params[:id]).first
    end

    # Only allow a trusted parameter "white list" through.
    def address_params
      params.require(:data).permit({attributes: [:street, :apt, :city, :state, :country, :zip, :customer_id]})
    end
end
