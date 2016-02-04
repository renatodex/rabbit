require 'rubygems'
require 'bundler/setup'
require 'sinatra'

# this will require all the gems not specified to a given group (default)
# and gems specified in your test group
Bundler.require(:default, :test)

class App < Sinatra::Base
  get '/' do
    puts 123
  end

  # Rest of your app
end
