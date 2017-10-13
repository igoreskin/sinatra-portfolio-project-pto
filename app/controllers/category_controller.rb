require 'pry'
require './config/environment'

class CategoryController < ApplicationController

  use Rack::Flash
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  get '/categories' do
    @categories = Category.all
    erb :'categories/categories'
  end

  get '/categories/:name' do
    @category = Category.find_by(name: params[:name])
    @inventor_slugs = []
    @category.inventors.each { |inventor| @inventor_slugs << inventor.slug }
    @inventor_slugs
    @invention_slugs = []
    @category.inventions.each { |invention| @invention_slugs << invention.slug }
    @invention_slugs
    erb :'categories/show_category'
  end


end
