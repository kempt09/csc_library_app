class ApplicationController < ActionController::API

  def catch_404
    render json: { errors: { message: 'Not Found'}}, status: :not_found
  end

  private

  def page
    params[:page] != nil ? params[:page] : 1
  end

  def per_page
    params[:limit] != nil ? params[:limit] : 20
  end

  def validate_user
    begin
      token = request.headers['Authorization'].split(' ').last
      user = User.where(token: token).first
      if user == nil
        render json: { errors: { message: 'Unauthorized'}}, status: :unauthorized
        return
      else
        @current_user = user
      end
    rescue StandardError => e
      render json: { errors: { message: 'Unauthorized'}}, status: :unauthorized
      return
    end
  end

  def is_staff?
    unless @current_user.staff?
      render json: {errors: { message: 'Unauthorized'}}, status: :unauthorized
    end
  end

  def is_admin?
    unless @current_user.staff.role < 2
      render json: { errors: { message: 'Unauthorized'}}, status: :unprocessable_entity
    end
  end

end
