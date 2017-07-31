class LogEntriesController < ApplicationController
  before_action :validate_user
  before_action :is_staff?, only: [:create, :update, :destroy]
  before_action :set_log_entry, only: [:show, :update, :destroy]

  # GET /log_entries
  def index
    @log_entries = LogEntry.all.includes(:user, :holding).paginate(page: page, per_page: per_page)
    render json: @log_entries, include: ['user', 'holding']
  end

  # GET /log_entries/1
  def show
    render json: @log_entry, include: ['user', 'holding']
  end

  # POST /log_entries
  def create
    @log_entry = LogEntry.new(log_entry_params)

    if @log_entry.save
      render json: @log_entry, status: :created, location: @log_entry
    else
      render json: @log_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /log_entries/1
  def update
    if @log_entry.update(log_entry_params)
      render json: @log_entry
    else
      render json: @log_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /log_entries/1
  def destroy
    @log_entry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_entry
      @log_entry = LogEntry.includes(:user, :holding).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def log_entry_params
      params.require(:data).permit({attributes: [:user_id, :holding_id, :item_id, :checkout_dt, :checkin_dt, :due_dt]})
    end
end
