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
	@questions = air_travel.all_questions
    
	mustache :index
  end
  
  get '/response/:num' do
	air_travel = Puzzles::AirTravel.new
	@question = air_travel.question(params[:num].to_i)
	
	mustache :response
  end
  
  post '/respond' do
	response = params[:response]
	redirect '/'
  end
  
end
