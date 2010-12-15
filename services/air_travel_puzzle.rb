module Puzzles
	class AirTravel
		
		def initialize
			@definitions = [
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
		
		def all_definitions
			@definitions
		end
		
		def definition(definition_num)
			foundDefinitions = @definitions.select{ |q| q[:num] == definition_num}
			unless foundDefinitions.empty?
				return foundDefinitions.first
			end
		end
		
		def get_pivot s
			s.index(/[a-zA-Z\-]+/)
		end

		def get_puzzle
			
			to_be_just = []
			pivot = 0
			@definitions.each do |q| 
				current_hint = q[:num].to_s.rjust(2) + ' ' + q[:hint]
				current_pivot = get_pivot(current_hint)
				pivot = [pivot, current_pivot].max
				to_be_just.push(current_hint)
			end

			result = []
			to_be_just.each do |hint|
				hint_pivot = get_pivot(hint)
				if hint_pivot < pivot
					result.push(hint.rjust(hint.length + pivot - hint_pivot, ' '))
				else
					result.push(hint)
				end
			end

			return result
			
		end
	end
end