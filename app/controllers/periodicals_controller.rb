class PeriodicalsController < ApplicationController
  before_action :validate_user, :is_staff?
  before_action :set_periodical, only: [:show, :update, :destroy]

  # GET /periodicals
  def index
    @periodicals = Periodical.where(:active => true).paginate(page: page, per_page: per_page)
    render json: @periodicals
  end

  # GET /periodicals/1
  def show
    render json: @periodical, include: ['authors', 'publisher', 'holding']
  end

  # POST /periodicals
  def create
    authors = params[:data][:relationships][:authors][:data]
    @periodical = Periodical.new(periodical_params)

    if @periodical.save
      authors.each do |author|
        AuthorCirculation.create(:circulation_id => @periodical.id, :author_id => author[:id])
      end
      render json: @periodical, status: :created, location: @periodical
    else
      render json: @periodical.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /periodicals/1
  def update
    if @periodical.update(periodical_params)
      render json: @periodical
    else
      render json: @periodical.errors, status: :unprocessable_entity
    end
  end

  # DELETE /periodicals/1
  def destroy
    @periodical.update(:active => false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_periodical
      @periodical = Periodical.includes(:authors, :publisher, :holding).where(:id => params[:id], :active => true).first
    end

    # Only allow a trusted parameter "white list" through.
    def periodical_params
      params.require(:data).permit({attributes: [:title, :volume, :volume_no, :holding_id, :publisher_id, :active]})
    end
end
