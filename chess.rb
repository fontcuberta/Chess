require 'pry'
$LOAD_PATH << '.'
require 'chess_mod'
#require 'chess_mod'



class Piece
	attr_accessor :name
	attr_accessor :color
	def initialize(name, color, *position)
		@name = name
		@color = color
		@actual_position = position
	end
end

class Rook < Piece
	def validate_movement(*to_go)
		if  Direction.straight(to_go, @actual_position)
			@actual_position = Asignation.new_position(to_go, @actual_position, @name, @color)
		else
			Asignation.invalid_movement
		end
	end
end

class Bishop < Piece
	def validate_movement(*to_go)
		if Direction.diagonal(to_go, @actual_position)
			@actual_position = Asignation.new_position(to_go, @actual_position, @name, @color)
		else
			Asignation.invalid_movement
		end
	end
end

class Queen < Piece
	def validate_movement(*to_go)
		if Direction.diagonal(to_go, @actual_position) or Direction.straight(to_go, @actual_position)
			@actual_position = Asignation.new_position(to_go, @actual_position, @name, @color)

		else
			Asignation.invalid_movement
		end
	end
end

class King < Piece
	def validate_movement(*to_go)
		if ((Direction.diagonal(to_go, @actual_position) or Direction.straight(to_go, @actual_position)) and Direction.one_step(to_go, @actual_position))
			@actual_position = Asignation.new_position(to_go, @actual_position, @name, @color)
		else
			Asignation.invalid_movement
		end
	end
end





black_rook1 = Rook.new("Tower", "Black", 0, 0)
black_bishop1 = Bishop.new("Bishop", "Black", 0, 0)
black_queen= Queen.new("Reina del arroz con pollo","Black",0,0)
black_rook1.validate_movement(1,1)
black_rook1.validate_movement(0,1)
black_bishop1.validate_movement(0,1)
black_bishop1.validate_movement(1,1)
black_queen.validate_movement(1,1)
black_queen.validate_movement(1,0)