class AddressesController < ApplicationController
  before_action :validate_user
  before_action :is_staff?, only: [:index, :destroy]
  before_action :set_address, only: [:show, :update, :destroy]

  # GET /addresses
  def index
    @addresses = Address.all.paginate(page: page, per_page: per_page)
    render json: @addresses, include: ['user']
  end

  # GET /addresses/1
  def show
    render json: @address, include: ['user']
  end

  # POST /addresses
  def create
    @address = Address.new(address_params)

    if @address.save
      render json: @address, status: :created, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      render json: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      if @current_user.staff?
        @address = Address.find(params[:id])
      else
        @address = Address.where(id: params[:id], :user_id => @current_user.id).first
      end

    end

    # Only allow a trusted parameter "white list" through.
    def address_params
      params.require(:data).permit({attributes: [:street, :apt, :city, :state, :country, :zip, :user_id, :created_at, :updated_at]})
    end
end
