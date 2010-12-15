require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'mustache/sinatra'
require 'json'
require 'services/air_travel_puzzle.rb'

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
	@task_description = 'Use the clues to complete the puzzle.'
	@title = 'AIR TRAVEL Crossword Puzzles'
	
	air_travel = Puzzles::AirTravel.new
	@definitions = air_travel.all_definitions
	@puzzle_items = air_travel.get_puzzle
    
	mustache :index
  end
  
  get '/response/:num' do
	air_travel = Puzzles::AirTravel.new
	@definition = air_travel.definition(params[:num].to_i)
	
	mustache :response
  end
  
  post '/respond' do
	response = params[:response]
	redirect '/'
  end
  
end
