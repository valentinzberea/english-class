module Puzzles
	class AirTravel
		
		def initialize
			@questions = [
				{
					:num => 1,
					:text => "an area of land where aircraft can land and take off, be kept, repaired, etc."
				},
				{
					:num => 2,
					:text => "a trip by airplane, especially carrying passengers on a regular service"
				},
				{
					:num => 3,
					:text => "a member of the cabin staff who looks after the passengers' needs"
				},
				{
					:num => 4,
					:text => "the act of leaving the ground by an airplane"
				},
				{
					:num => 5,
					:text => "a person who flies an airplane; captain"
				},
				{
					:num => 6,
					:text => "a big building where planes are kept"
				},
				{
					:num => 7,
					:text => "the act of coming down onto the ground again from the air"
				},
				{
					:num => 8,
					:text => "the science or practice of flying"
				},
				{
					:num => 9,
					:text => "all the people working on an airplane"
				},
				{
					:num => 10,
					:text => "a plane without an engine"
				}]
		end
		
		def all_questions
			@questions
		end
	end
end