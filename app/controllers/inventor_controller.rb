require 'pry'
require './config/environment'
require 'rack-flash'

class InventorController < ApplicationController

  use Rack::Flash
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  get '/inventors' do
    @slugs = []
    Inventor.all.each { |inventor| @slugs << inventor.slug }
    @slugs
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

  get '/inventors/:slug/edit' do
    @inventor = Inventor.find_by_slug(params[:slug])
    erb :'/inventors/edit_inventor'
  end

  post '/inventors/:slug/edit' do
    @inventor = Inventor.find_by_slug(params[:slug])
    erb :'/inventors/edit_inventor'
  end

  patch '/inventors/:slug' do
    @inventor = Inventor.find_by_slug(params[:slug])
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      if @inventor == current_user
        @inventor.update(username: params[:username], email: params[:email], password: params[:password])
        redirect to "/inventors/#{@inventor.slug}"
      else
        flash[:message] = "You can only edit your own profile!"
        redirect to "/inventors/#{@inventor.slug}"
      end
    else
      flash[:message] = "You must enter username, email and password to edit your profile!"
      redirect to "/inventors/#{@inventor.slug}"
    end
  end

  post '/inventors/:slug/delete' do
    @inventor = Inventor.find_by_slug(params[:slug])
    if logged_in? && @inventor == current_user && @inventor.class == Inventor
      erb :'/inventors/delete_inventor'
    else
      flash[:message] = "You can only delete your own profile!"
      redirect to "/inventors/#{@inventor.slug}"
    end
  end

  delete '/inventors/:slug/delete' do
    @inventor = Inventor.find_by_slug(params[:slug])
    @inventor.destroy
    redirect to '/logout'
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/'
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      Inventor.find(session[:user_id])
    end
  end

end
