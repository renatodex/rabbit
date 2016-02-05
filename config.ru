['rubygems', 'bundler/setup', 'sinatra', 'sinatra/contrib/all'].each do |f|
  require f
end

Bundler.require(:default, :test, :development)
set :views, "public"

class App < Sinatra::Base
  register Sinatra::Contrib

  not_found do
    status 404
    erb :"404"
  end
end

require_all 'app/**/controllers/*'
require_all 'lib/*'
require_all 'app/**/routes.rb'

run App
