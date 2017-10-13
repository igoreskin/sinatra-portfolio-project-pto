require 'pry'
require './config/environment'

class InventionController < ApplicationController

  use Rack::Flash
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  get '/' do
    erb :index
  end

  get '/welcome' do
    if logged_in?
      @inventor = current_user
      erb :welcome_page
    else
      redirect to '/login'
    end
  end

  get '/inventions' do
    @slugs = []
    Invention.all.each { |invention| @slugs << invention.slug }
    @slugs
    erb :'/inventions/inventions'
  end

  get '/inventions/new' do
    erb :'/inventions/create_invention'
  end

  post '/inventions' do
    if current_user.class == Inventor
      @inventor = current_user
    else
      flash[:message] = "To file an invention you must be logged in as an Inventor!"
      redirect to '/inventions'
    end
    if params[:status] != "pending"
      flash[:message] = "The patent status of a new invention must be pending!"
      redirect to '/inventions/new'
    end
    if !params[:name].empty? && !params[:description].empty?
      if Invention.find_by_name(params[:name])
        flash[:message] = "This invention already exists!"
        redirect to '/inventions/new'
      else
        @invention = Invention.create(name: params[:name], description: params[:description], category_ids: params[:categories], status: params[:status], inventor_id: @inventor.id)
      end
    else
      flash[:message] = "To file a new invention you must enter its name and description!"
      redirect to '/inventions/new'
    end
    redirect "inventions/#{@invention.slug}"
  end

  get '/inventions/:slug' do
    @invention = Invention.find_by_slug(params[:slug])
    erb :'/inventions/show_invention'
  end

  get '/inventions/:slug/edit' do
    @invention = Invention.find_by_slug(params[:slug])
    erb :'inventions/edit_invention'
  end

  post '/inventions/:slug/edit' do
    @invention = Invention.find_by_slug(params[:slug])
    erb :'inventions/edit_invention'
  end

  patch '/inventions/:slug' do
    @invention = Invention.find_by_slug(params[:slug])
    if current_user.class == Inventor
      @inventor = current_user
    else
      flash[:message] = "To edit an invention you must be logged in as an Inventor!"
      redirect to "/inventions/#{@invention.slug}"
    end
    if @invention.inventor_id != @inventor.id
      flash[:message] = "You can only edit your own inventions!"
      redirect to "/inventions/#{@invention.slug}"
    end
    if params[:status] != "pending"
      flash[:message] = "To update the patent status of an invention you must be logged in as an Inspector!"
      redirect to "/inventions/#{@invention.slug}/edit"
    end
    if !params[:description].empty?
      @invention.update(description: params[:description], category_ids: params[:categories])
      redirect to "/inventions/#{@invention.slug}"
    else
      flash[:message] = "Please enter a new description of your Invention!"
      redirect to "/inventions/#{@invention.slug}/edit"
    end
  end

  post '/inventions/:slug/delete' do
    @invention = Invention.find_by_slug(params[:slug])
    if logged_in? && @invention.inventor_id == current_user.id && current_user.class == Inventor
      erb :'/inventions/delete_invention'
    else
      flash[:message] = "You can only delete your own inventions!"
      redirect to '/inventions'
    end
  end

  delete '/inventions/:slug/delete' do
    @invention = Invention.find_by_slug(params[:slug])
    @invention.destroy
    redirect to '/inventions'
  end

end
