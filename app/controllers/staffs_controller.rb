class StaffsController < ApplicationController
  before_action :validate_user, :is_staff?
  before_action :set_staff, only: [:show, :update, :destroy]

  # GET /staffs
  def index
    @staffs = Staff.where(:active => true).paginate(page: page, per_page: per_page)
    render json: @staffs, include: ['user']
  end

  # GET /staffs/1
  def show
    render json: @staff, include: ['user']
  end

  # POST /staffs
  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      render json: @staff, status: :created, location: @staff
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /staffs/1
  def update
    if @staff.update(staff_params)
      render json: @staff
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # DELETE /staffs/1
  def destroy
    @staff.update(:active => false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.where(:id => params[:id], :active => true).first
    end

    # Only allow a trusted parameter "white list" through.
    def staff_params
      params.require(:data).permit({attributes: [:rank, :role, :user_id, :active]})
    end
end
