module Puzzles
	class AirTravel
		
		def initialize
			@definitions = [
				{
					:num => 1,
					:text => "an area of land where aircraft can land and take off, be kept, repaired, etc.",
					:hint => "A______",
					:response => "AIRPORT"
				},
				{
					:num => 2,
					:text => "a trip by airplane, especially carrying passengers on a regular service",
					:hint => "__I___",
					:response => "FLIGHT"
				},
				{
					:num => 3,
					:text => "a member of the cabin staff who looks after the passengers' needs",
					:hint => "_____R_",
					:response => "STEWARD"
				},
				{
					:num => 4,
					:text => "the act of leaving the ground by an airplane",
					:hint => "____-___",
					:response => "TAKE-OFF"
				},
				{
					:num => 5,
					:text => "a person who flies an airplane; captain",
					:hint => "____T",
					:response => "PILOT"
				},
				{
					:num => 6,
					:text => "a big building where planes are kept",
					:hint => "_____R",
					:response => "HANGAR"
				},
				{
					:num => 7,
					:text => "the act of coming down onto the ground again from the air",
					:hint => "_A_____",
					:response => "LANDING"
				},
				{
					:num => 8,
					:text => "the science or practice of flying",
					:hint => "_V______",
					:response => "AVIATION"
				},
				{
					:num => 9,
					:text => "all the people working on an airplane",
					:hint => "__E_",
					:response => "CREW"
				},
				{
					:num => 10,
					:text => "a plane without an engine",
					:hint => "_L____",
					:response => "GLIDER"
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
					result.push({:hint => hint.rjust(hint.length + pivot - hint_pivot, ' ')})
				else
					result.push(:hint => hint)
				end
			end

			return result
			
		end
		
		def try_response (definition_num, response)
			foundDefinitions = @definitions.select{ |q| q[:num] == definition_num}
			unless foundDefinitions.empty?
				definition = foundDefinitions.first
				if definition[:response].upcase == response.upcase
					return {:success => true, :response => definition[:response]}
				else
					return {:success => false, :response => definition[:response]}
				end
			end
		end
		
	end
end