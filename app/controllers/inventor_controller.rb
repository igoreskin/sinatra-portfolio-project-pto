require 'pry'
require './config/environment'
require 'rack-flash'

class InventorController < ApplicationController

  use Rack::Flash
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  get '/inventors' do
    erb :'inventors/inventors'
  end

  get '/signup' do
    erb :'/inventors/create_inventor'
  end

  post '/signup' do
    if !params[:name].empty? && !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      @user = Inventor.create(params)
      session[:user_id] = @user.id
      redirect '/welcome'
    else
      flash[:message] = "You must enter your name, username, email and password to sign up!"
      redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/inventors/login'
    else
      redirect '/welcome'
    end
  end

  post '/login' do
    @user = Inventor.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/welcome'
    else
      flash[:message] = "You have to enter username and password to log in!"
      redirect '/login'
    end
  end

  get '/inventors/:slug' do
    @inventor = Inventor.find_by_slug(params[:slug])
    @inventions = @inventor.inventions
    erb :'/inventors/show_inventor'
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/login'
    end
  end

end
