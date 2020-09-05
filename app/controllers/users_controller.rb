require 'json_web_token'
require 'services/auth_token'
class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def login
    usr = User.find_by(username: user_params[:username])
    if usr
      if usr.authenticate(user_params[:password])
        token = EncodeTokenService.fire(usr.id)
        render json: { user: usr, token: token }, status: :ok
      else
        render json: { error: 'Invalid credentials' }, status: 400
      end
    else
      render json: { error: 'User not found' }, status: 400
    end
  end

  def auto_login
    token = EncodeTokenService.fire(@current_user.id)
    render json: { user: @current_user, token: token }, status: :ok
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      token = EncodeTokenService.fire(new_user.id)
      render json: { user: new_user, token: token }, status: :ok
    else
      render json: { errors: new_user.errors.full_messages }, status: 400
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
