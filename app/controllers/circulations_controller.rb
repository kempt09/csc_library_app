class CirculationsController < ApplicationController
  before_action :validate_user
  before_action :set_circulation, only: [:show, :update, :destroy]

  # GET /circulations
  def index
    @circulations = Circulation.includes(:author, :publisher).where(:admin_id => @current_user.id).paginate(page: page, per_page: per_page)
    render json: @circulations
  end

  # GET /circulations/1
  def show
    render json: @circulation, include: ['author', 'publisher']
  end

  # POST /circulations
  def create
    @circulation = Circulation.new(circulation_params)
    @circulation.admin_id = @current_user.id

    if @circulation.save
      render json: @circulation, status: :created, location: @circulation
    else
      render json: {errors: @circulation.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /circulations/1
  def update
    if @circulation.update(circulation_params)
      render json: @circulation
    else
      render json: {errors: @circulation.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /circulations/1
  def destroy
    @circulation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circulation
      @circulation = Circulation.includes(:author, :publisher).where(:id => params[:id], :admin_id => @current_user.id).first
    end

    # Only allow a trusted parameter "white list" through.
    def circulation_params
      params.require(:data).permit({attributes: [:title, :subtitle, :cost, :publisher_id, :author_id]})
    end
end
