class PublishersController < ApplicationController
  before_action :validate_user
  before_action :set_publisher, only: [:show, :update, :destroy]

  # GET /publishers
  def index
    @publishers = Publisher.where(:admin_id => @current_user.id).paginate(page: page, per_page: per_page)
    render json: @publishers
  end

  # GET /publishers/1
  def show
    render json: @publisher, include: ['circulations']
  end

  # POST /publishers
  def create
    @publisher = Publisher.new(publisher_params)
    @publisher.admin_id = @current_user.id

    if @publisher.save
      render json: @publisher, status: :created, location: @publisher
    else
      render json: {errors: @publisher.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /publishers/1
  def update
    if @publisher.update(publisher_params)
      render json: @publisher
    else
      render json: {errors: @publisher.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /publishers/1
  def destroy
    @publisher.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publisher
      @publisher = Publisher.includes(:circulations).where(:id => params[:id], :admin_id => @current_user.id).first
    end

    # Only allow a trusted parameter "white list" through.
    def publisher_params
      params.require(:data).permit({attributes: [:name]})
    end
end
