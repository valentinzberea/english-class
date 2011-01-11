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

  use Rack::Session::Pool
  
  get '/' do
	@task_description = 'Use the clues to complete the puzzle.'
	@title = 'AIR TRAVEL Crossword Puzzles'
	
	air_travel = Puzzles::AirTravel.new
	@definitions = air_travel.all_definitions
	
	@puzzle_items = get_puzzle
    
	mustache :index
  end
  
  get '/response/:num' do
	air_travel = Puzzles::AirTravel.new
	@definition = air_travel.definition(params[:num].to_i)
	
	mustache :response
  end
  
  post '/respond' do
	response = params[:response]
	definition_num = params[:num].to_i
	
	air_travel = Puzzles::AirTravel.new
	result = air_travel.try_response(definition_num, response)
	
	puzzle_item = get_puzzle[definition_num - 1][:hint]
	
	if result[:success]
		puzzle_item = puzzle_item.sub(/(_|[A-Z\-])*$/, result[:response])
		get_puzzle[definition_num - 1] = { :response_class => 'last_response', :hint => puzzle_item}
	else
		get_puzzle[definition_num - 1] = { :response_class => '', :hint => puzzle_item}
	end
	redirect '/'
  end
  
  def get_puzzle
	unless session[:puzzle]
		air_travel = Puzzles::AirTravel.new
		session[:puzzle] = air_travel.get_puzzle
	end
	session[:puzzle]
  end
  
end
