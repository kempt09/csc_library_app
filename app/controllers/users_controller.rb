class UsersController < ApplicationController
  before_action :validate_user
  before_action :is_staff?, only: [:index, :create, :destroy]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all.paginate(page: page, per_page: per_page)
    render json: @users, include: ['staff', 'student', 'community_user']
  end

  # GET /users/1
  def show
    render json: @user, include: ['staff', 'student', 'community_user', 'address']
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if @current_user.staff?
        @user = User.find(params[:id])
      else
        @user = User.where(id: @current_user.id).first
      end
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:data).permit({attributes: [:first_name, :last_name, :email, :phone, :active, :token, :hashed_password, :created_at, :updated_at]})
    end
end
