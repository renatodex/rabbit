require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/contrib/all'

require_relative 'controller'

Bundler.require(:default, :test, :development)
set :views, "views"

class App < Sinatra::Base
  register Sinatra::Contrib
end


require_relative 'app/shopping/controllers/application_controller'
require_relative 'app/shopping/controllers/shopping_controller'
require_relative 'app/shopping/controllers/extra_controller'

require_relative 'lib/application_router'
require_relative 'app/shopping/routes'

run App
