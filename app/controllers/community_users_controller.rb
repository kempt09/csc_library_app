class CommunityUsersController < ApplicationController
  before_action :set_community_user, only: [:show, :update, :destroy]

  # GET /community_users
  def index
    @community_users = CommunityUser.all

    render json: @community_users
  end

  # GET /community_users/1
  def show
    render json: @community_user
  end

  # POST /community_users
  def create
    @community_user = CommunityUser.new(community_user_params)

    if @community_user.save
      render json: @community_user, status: :created, location: @community_user
    else
      render json: @community_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /community_users/1
  def update
    if @community_user.update(community_user_params)
      render json: @community_user
    else
      render json: @community_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /community_users/1
  def destroy
    @community_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_user
      @community_user = CommunityUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def community_user_params
      params.require(:data).permit({attributes: [:expiration_dt, :user_id, :created_at, :updated_at]})
    end
end
