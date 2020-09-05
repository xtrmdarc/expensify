require 'services/auth_token'
class ApplicationController < ActionController::API
  def authorized
    header = request.headers['Authorization']
    if header
      header_token = header.split(' ')[-1]

      begin
        user_id = DecodeTokenService.fire(header_token)
        @current_user = User.find(user_id)
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    else
      render json: { error: 'Missing authorization header' }, status: :unauthorized
    end
  end
end
