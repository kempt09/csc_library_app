class ReferencesController < ApplicationController
  before_action :validate_user, :is_staff?
  before_action :set_reference, only: [:show, :update, :destroy]

  # GET /references
  def index
    @references = Reference.all.paginate(page: page, per_page: per_page)
    render json: @references
  end

  # GET /references/1
  def show
    render json: @reference, include: ['authors', 'publisher', 'holding']
  end

  # POST /references
  def create
    authors = params[:data][:relationships][:authors][:data]
    @reference = Reference.new(reference_params)

    if @reference.save
      authors.each do |author|
        AuthorCirculation.create(:circulation_id => @referece.id, :author_id => author[:id])
      end
      render json: @reference, status: :created, location: @reference
    else
      render json: @reference.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /references/1
  def update
    if @reference.update(reference_params)
      render json: @reference
    else
      render json: @reference.errors, status: :unprocessable_entity
    end
  end

  # DELETE /references/1
  def destroy
    @reference.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference
      @reference = Reference.includes(:authors, :publisher, :holding).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reference_params
      params.require(:data).permit({attributes: [:title, :subtitle, :publisher_id, :holding_id, :created_at, :updated_at]})
    end
end
