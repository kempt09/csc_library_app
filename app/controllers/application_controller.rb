class ApplicationController < ActionController::API
  include BCrypt

  def token
    email = params[:email]
    password = params[:password]
    begin
      user = User.where(email: email.downcase).first
      if user != nil
        if Password.new(user[:hashed_password]) == password
          user.update_token
          render json: {
            data: {
              id: user.id,
              token: user.token
            }
          }
        else
          render json: { errors: [{message: 'Unauthorized'}]}, status: :unauthorized
        end
      else
        render json: { errors: [{message: 'Unauthorized'}]}, status: :unauthorized
      end
    rescue
      render json: { errors: [{message: 'Unauthorized'}]}, status: :unauthorized
    end
  end

  def catch_404
    render json: { errors: [{ message: 'Not Found'}]}, status: :not_found
  end

  private

  def page
    !params[:page].nil? ? params[:page] : 1
  end

  def per_page
    !params[:limit].nil? ? params[:limit] : 25
  end

  def validate_user
    begin
      if request.headers['Authorization'].nil?
        render json: { errors: [{ message: 'Missing Authorization In Headers'}]}, status: :unauthorized
        return
      end
      token = request.headers['Authorization'].split(' ').last
      user = User.where(token: token).first
      if user == nil
        render json: { errors: [{ message: 'Unauthorized'}]}, status: :unauthorized
        return
      else
        @current_user = user
      end
    rescue StandardError => e
      render json: { errors: [{ message: e.message}]}, status: :unauthorized
      return
    end
  end

end
