require 'pry'
require './config/environment'
require 'rack-flash'

class InspectorController < ApplicationController

  use Rack::Flash
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  get '/inspectors' do
    erb :'inspectors/inspectors'
  end

  get '/inspector_login' do
    if !logged_in?
      erb :'/inspectors/inspector_login'
    else
      redirect '/welcome_inspector'
    end
  end

  post '/inspector_login' do
    @user = Inspector.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/welcome_inspector'
    else
      flash[:message] = "You have to enter username and password to log in!"
      redirect '/inspector_login'
    end
  end

  get '/welcome_inspector' do
    erb :welcome_inspector
  end

end
