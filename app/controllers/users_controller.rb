class UsersController < ApplicationController
  def login
    usr = User.find_by(username: params[:username])
    if usr
      render json: usr, status: :ok
    else
      render json: {error: 'User not found'}, status: 400
    end

  end
end
