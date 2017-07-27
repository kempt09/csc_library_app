class UtilitiesController < ApplicationController
  before_action :validate_user, :is_staff?, except: [:token]

  def token
    email = params[:email]
    password = params[:password]
    begin
      user = User.where(email: email).first
      if Password.new(user[:hashed_password]) == password && user[:active]
        user = user.update_token
        render json: {
          data: {
            user: user,
            isStaff: user.staff?,
            isStudent: user.student?,
            isCommunityUser: user.community_user?
          }
        }
      else
        render json: { errors: [{message: 'Unauthorized'}]}, status: :unathorized
      end
    rescue StandardError
      render json: { errors: [{message: 'Unauthorized'}]}, status: :unathorized
    end
  end

  def checkout
    begin
      user = User.find(params[:user_id])
      holding = Holding.find(params[:holding_id])
      item = holding.find_item(params[:item_id])
      if item.available?
        log_entry = user.create_checkout(item)
        render json: log_entry, status: :created
      else
        raise 'Item Unavailable'
      end
    rescue StandardError => e
      render json: { errors: {message: e}}, status: :unprocessable_entity
    end
  end

  def checkin
    begin
      holding = Holding.find(params[:holding_id])
      item = holding.find_item(params[:item_id])
      if user.create_checkin(item)
        render json: {message: 'Success'}, status: :ok
      else
        raise 'Error Checking In Item'
      end
    rescue StandardError => e
      render json: { errors: {message: e}}, status: :unprocessable_entity
    end
  end

  def inventory
    begin
      items = LogEntry.includes(:holding)
                .where(:user_id => params[id], checkin_dt: nil)
                .paginate(page: page, per_page: per_page)
                .order(updated_dt: :desc)
      collection = []
      items.each do |item|
        collection << {
          log_entry: item,
          holding: item.holding,
          item: item.holding_item
        }
      end
      render json: collection
    rescue StandardError => e
      render json: { errors: {message: e}}, status: :unprocessable_entity
    end
  end

  def history
    begin
      start_dt = Time.now.beginning_of_year
      end_dt = Time.now
      items = LogEntry.includes(:holding)
                .where(:user_id => params[id], checkin_dt: start_dt..end_dt)
                .paginate(page: page, per_page: per_page)
                .order(updated_dt: :desc)
      collection = []
      items.each do |item|
        collection << {
          log_entry: item,
          holding: item.holding,
          item: item.holding_item
        }
      end
      render json: collection
    rescue StandardError => e
      render json: { errors: {message: e}}, status: :unprocessable_entity
    end
  end

  def send_password
    begin
      user = User.find(params[:id])
      user.send_password
      render json: { message: 'Email Sent'}, status: :ok
    rescue StandardError => e
      render json: { errors: {message: e}}, status: :unprocessable_entity
    end
  end

end
