require './config/environment'

class InspectorController < ApplicationController

  use Rack::Flash
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  get '/inspectors' do
    erb :'inspectors/inspectors'
  end


end
