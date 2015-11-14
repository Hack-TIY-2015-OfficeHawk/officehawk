class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null

  helper_method :current_employee

  def current_employee
    token = request.headers['auth-token']
    token && Employee.find_by(auth_token: token)
  end

  def authenticate_employee!
    unless current_employee
      token = request.headers['auth-token']
      render json: { error: "Could not authenticate with auth-token:'#{token}'" },
             status: :unauthorized
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: "Object not found: #{error.message}" }, status: :not_found
  end

end
