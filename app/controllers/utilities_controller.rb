class UtilitiesController < ApplicationController
  before_action :validate_user

  def checkout
    begin
      customer = Customer.find_by(:id => params[:customer_id], :admin_id => @current_user.id)
      circulation = Circulation.find_by(:id => params[:circulation_id], :admin_id => @current_user.id)
      if circulation.available?
        log_entry = customer.create_checkout(circulation)
        render json: log_entry, status: :created
      else
        raise 'Item Unavailable'
      end
    rescue StandardError => e
      render json: { errors: [{message: e.message}]}, status: :unprocessable_entity
    end
  end

  def checkin
    begin
      customer = Customer.find_by(:id => params[:customer_id], :admin_id => @current_user.id)
      circulation = Circulation.find_by(:id => params[:circulation_id], :admin_id => @current_user.id)
      if customer.create_checkin(circulation)
        render json: {message: 'Success'}, status: :ok
      else
        raise 'Error Checking In Item'
      end
    rescue StandardError => e
      render json: { errors: [{message: e.message}]}, status: :unprocessable_entity
    end
  end

end
