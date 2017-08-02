class CirculationsController < ApplicationController
  before_action :validate_user, :is_staff?
  before_action :set_circulation, only: [:show, :update, :destroy]

  # GET /circulations
  def index
    @circulations = Circulation.where(:active => true).paginate(page: page, per_page: per_page)
    render json: @circulations
  end

  # GET /circulations/1
  def show
    render json: @circulation, include: ['circulations', 'periodicals', 'references']
  end

  # POST /circulations
  def create
    authors = params[:data][:relationships][:authors][:data]
    @circulation = Circulation.new(circulation_params)
    if @circulation.save
      authors.each do |author|
        AuthorCirculation.create(:circulation_id => @circulation.id, :author_id => author[:id])
      end
      render json: @circulation, status: :created, location: @circulation
    else
      render json: @circulation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /circulations/1
  def update
    if @circulation.update(circulation_params)
      render json: @circulation
    else
      render json: @circulation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /circulations/1
  def destroy
    @circulation.update(:active => false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circulation
      @circulation = Circulation.includes(:authors, :publisher, :holding).where(:id => params[:id], :active => true).first
    end

    # Only allow a trusted parameter "white list" through.
    def circulation_params
      params.require(:data).permit({attributes: [:title, :subtitle, :cost, :publisher_id, :holding_id, :active]})
    end
end
