module Direction
	def Direction.diagonal(to_go, actual_position)
		(to_go[0]-actual_position[0]).abs == (to_go[1]-actual_position[1]).abs
	end

	def Direction.straight(to_go, actual_position)
		actual_position[0] == to_go[0] or actual_position[1] == to_go[1]
	end

	def one_step(to_go, actual_position)
		(to_go[0]-@actual_position[0]).abs <= 1
	end
end

module Asignation

	def Asignation.new_position(to_go, actual_position, name, color)
		actual_position= to_go
		puts "Good move! Your #{color} #{name} is now in #{actual_position}"
		return actual_position
	end

	def Asignation.invalid_movement
		puts "You know nothing, Jon Snow"
	end
end