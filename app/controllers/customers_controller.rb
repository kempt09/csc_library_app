class CustomersController < ApplicationController
  before_action :validate_user
  before_action :set_customer, only: [:show, :update, :destroy]

  # GET /customers
  def index
    @customers = Customer.where(:admin_id => @current_user.id)
    render json: @customers
  end

  # GET /customers/1
  def show
    render json: @customer, include: ['addresses', 'log_entries', 'log_entries.circulation']
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)
    @customer.admin_id = @current_user.id

    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: {errors: @customer.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: {errors: @customer.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.includes(:addresses, {log_entries: [:circulation]}).where(:id => params[:id], :admin_id => @current_user.id).first
    end

    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:data).permit({attributes: [:first_name, :last_name, :email, :phone, :notes]})
    end
end
