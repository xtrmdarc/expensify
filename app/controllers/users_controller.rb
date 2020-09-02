require 'json_web_token'

class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def login
    usr = User.find_by(username: params[:username])
    if usr
      if usr.authenticate(params[:password])
        token = JsonWebToken.encode user_id: usr.id
        render json: { user: usr, token: token }, status: :ok
      else
        render json: { error: 'Invalid credentials' }, status: 400
      end
    else
      render json: { error: 'User not found' }, status: 400
    end
  end

  def auto_login
    token = JsonWebToken.encode user_id: @current_user.id
    render json: { user: @current_user, token: token }, status: :ok
  end

  def create
    new_user = User.new(username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if new_user.save
      token = JsonWebToken.encode user_id: new_user.id
      render json: { user: new_user, token: token }, status: :ok
    else
      render json: { errors: new_user.errors.full_messages }, status: 400
    end
  end
end
