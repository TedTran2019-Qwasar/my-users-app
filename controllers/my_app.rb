require 'sinatra/base'
require_relative '../models/user'

class MyApp < Sinatra::Base
  configure do
    set :views, './views'
  end

  def create(email, password)
    User.all.select { |user| user['email'] == email && user['password'] == password }
        .first
  end

  enable :sessions

  get '/' do
    @users = User.all
    erb :index
  end

  post '/sign_in'  do
    if session[:user_id]
      return "You are already signed in!\n"
    end

    user = create(params[:email], params[:password])
    if user
      session[:user_id] = user['id']
      "You've signed in!\n"
    else
      "Invalid credentials\n"
    end
  end

  delete '/sign_out' do
    if session[:user_id]
      session[:user_id] = nil
      "You've signed out!\n"
    else
      "You weren't signed in!\n"
    end
  end
end