class UtilitiesController < ApplicationController
  before_action :validate_staff, except: [:token, :send_password, :customer_history]
  before_action :validate_user, only: [:send_password, :customer_history]

  include BCrypt
  def token
    email = params[:email]
    password = params[:password]
    begin
      user = User.where(email: email.downcase).first
      if user != nil
        if user.user_type == 'STA'
          if Password.new(user[:hashed_password]) == password && user[:active]
            if user.update_token
              render json: {
                data: {
                  user: user,
                  address: user.address,
                  isStaff: user.staff?,
                  isStudent: user.student?,
                  isCommunityUser: user.community_user?
                }
              }
            else
              raise 'Error Signing In'
            end
          else
            render json: { errors: [{message: 'Unauthorized'}]}, status: :unauthorized
          end
        else
          render json: { errors: [{message: 'Customer Support Comming Shortly'}]}, status: :unauthorized
        end
      end
    rescue StandardError => e
      render json: { errors: [{message: 'Unauthorized'}]}, status: :unauthorized
    end
  end

  def checkout
    begin
      user = User.where(params[:user_id])
      holding = Holding.where(:section => params[:section]).first
      item = holding.find_item(params[:item_id])
      if item.available?
        log_entry = user.create_checkout(item)
        render json: log_entry, status: :created
      else
        raise 'Item Unavailable'
      end
    rescue StandardError => e
      render json: { errors: [{message: e}]}, status: :unprocessable_entity
    end
  end

  def checkin
    begin
      user = User.find(params[:user_id])
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
      items = LogEntry.includes(:holding, :user).where(checkin_dt: nil, :active => true).order(checkin_dt: :desc)
      collection = []
      items.each do |item|
        collection << {
          log_entry: item,
          user: item.user,
          holding: item.holding,
          item: item.holding_item
        }
      end
      render json: collection
    rescue StandardError => e
      render json: { errors: {message: e}}, status: :unprocessable_entity
    end
  end

  def customer_history
    begin
      items = LogEntry.includes(:holding)
                .where(:user_id => @current_user.id, :active => true)
                .paginate(page: page, per_page: per_page)
                .order(id: :desc)
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
      @current_user.send_password
      render json: { message: 'Email Sent'}, status: :ok
    rescue StandardError => e
      render json: { errors: {message: e}}, status: :unprocessable_entity
    end
  end

end
