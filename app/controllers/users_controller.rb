require 'JsonWebToken'

class UsersController < ApplicationController
  def login
    usr = User.find_by(username: params[:username])
    if usr
      if usr.authenticate(params[:password])
        p usr
        puts usr
        token = JsonWebToken::encode user_id: usr.id
        render json: { user: usr, token: token }, status: :ok
      else
        render json: { error: 'Invalid credentials' }, status: 400
      end
    else
      render json: { error: 'User not found' }, status: 400
    end
  end

  def create
    new_user = User.new(username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if new_user.save
      render json: new_user, status: :ok
    else
      render json: { errors: new_user.errors.full_messages }, status: 400
    end
  end
end
