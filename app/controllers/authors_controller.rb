class AuthorsController < ApplicationController
  before_action :validate_user, :is_staff?
  before_action :set_author, only: [:show, :update, :destroy]

  # GET /authors
  def index
    if params[:include_all] === 'true'
      @authors = Author.all
    else
      hash =  {}
      if params[:first_name] != nil && params[:first_name] != ''
        hash[:first_name] = params[:first_name]
      end

      if params[:last_name] != nil && params[:last_name] != ''
        hash[:last_name] = params[:last_name]
      end
      @authors = Author.where(hash).paginate(page: page, per_page: per_page).order(last_name: :asc, first_name: :asc)
    end
    render json: @authors
  end

  # GET /authors/1
  def show
    render json: @author, includes: ['circulations', 'references', 'periodicals']
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

    if @author.save
      render json: @author, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  def update
    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  def destroy
    @author.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.includes(:references, :circulations, :periodicals).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def author_params
      params.require(:data).permit({attributes: [:first_name, :last_name, :created_at, :updated_at]})
    end
end
