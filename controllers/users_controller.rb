require 'sinatra/base'
require_relative '../models/user'

class UsersController < Sinatra::Base
  def create(user_info)
    User.create(user_info)
  end

  enable :sessions
  
  def all
    users = User.all
    users.each { |user| user.delete 'password'}
    users
  end

  def update_password(user_id, password) 
    User.update(user_id, 'password', password)
  end
  
  get '/' do
    all.to_s
  end

  post '/' do
    user_id = create(params)
    "Successively created user ##{user_id}!\n"
  end

  put '/' do
    if session[:user_id]
      update_password(session[:user_id], params[:password])
      "Successfully updated password\n"
    else
      "You must be signed in to update your password\n"
    end
  end

  delete '/' do
    if session[:user_id]
      user_id = session[:user_id]
      User.destroy(user_id)
      session[:user_id] = nil
      "Successfully deleted user ##{user_id}\n"
    else
      "You aren't logged in!\n"
    end
  end
end