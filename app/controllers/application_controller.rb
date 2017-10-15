require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end



  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      if session[:user_id] <= 1000
        Inspector.find(session[:user_id])
      else
        Inventor.find(session[:user_id])
      end
    end
  end

end
