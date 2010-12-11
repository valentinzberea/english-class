class App
  module Views
    class Index < Layout
		def task_description
			'Use the clues to complete the puzzle.'
		end
		def title
			'AIR TRAVEL Crossword Puzzles'
		end
		def questions
			air_travel = Puzzles::AirTravel.new
			air_travel.all_questions
		end
    end
  end
end