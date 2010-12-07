require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'mustache/sinatra'

class App < Sinatra::Base
  register Mustache::Sinatra
  require 'views/layout'

  set :root, File.dirname(__FILE__)
  set :public, 'public/'

  set :mustache, {
    :views => 'views/',
    :templates => 'templates/'
  }

  get '/' do
    @title = "6th Moment"
    mustache :index
  end

end
