require '../services/air_travel_puzzle.rb'


def get_pivot s
	s.index(/[a-zA-Z\-]+/)
end

service = Puzzles::AirTravel.new
to_be_just = []
pivot = 0
service.all_questions.each do |q| 
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

result.each { |h| puts h}