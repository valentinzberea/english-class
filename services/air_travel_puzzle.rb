module Puzzles
	class AirTravel
		
		def initialize
			@questions = [
				{
					:num => 1,
					:text => "an area of land where aircraft can land and take off, be kept, repaired, etc.",
					:hint => "A______"
				},
				{
					:num => 2,
					:text => "a trip by airplane, especially carrying passengers on a regular service",
					:hint => "__I___"
				},
				{
					:num => 3,
					:text => "a member of the cabin staff who looks after the passengers' needs",
					:hint => "_____R_"
				},
				{
					:num => 4,
					:text => "the act of leaving the ground by an airplane",
					:hint => "____-___"
				},
				{
					:num => 5,
					:text => "a person who flies an airplane; captain",
					:hint => "____T"
				},
				{
					:num => 6,
					:text => "a big building where planes are kept",
					:hint => "_____R"
				},
				{
					:num => 7,
					:text => "the act of coming down onto the ground again from the air",
					:hint => "_A_____"
				},
				{
					:num => 8,
					:text => "the science or practice of flying",
					:hint => "_V______"
				},
				{
					:num => 9,
					:text => "all the people working on an airplane",
					:hint => "__E_"
				},
				{
					:num => 10,
					:text => "a plane without an engine",
					:hint => "_L____"
				}]
		end
		
		def all_questions
			@questions
		end
		
		def question(question_num)
			foundQuestions = @questions.select{ |q| q[:num] == question_num}
			unless foundQuestions.empty?
				return foundQuestions.first
			end
		end
		
		def get_puzzle(questions)

		end
	end
end