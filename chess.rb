require 'pry'
$LOAD_PATH << '.'
require 'chess_mod'



#Piece class just initialize the common atts for every piece in the set
class Piece
	attr_accessor :name
	attr_accessor :color
	def initialize(name, color, *position)
		@name = name
		@color = color
		@actual_position = position
	end
end

#King class has a validate_movement method. He could be moved one step in any direction
class King < Piece
	def validate_movement(*to_go)
		if ((Direction.diagonal(to_go, @actual_position) or Direction.straight(to_go, @actual_position)) and Direction.one_step(to_go, @actual_position))
			@actual_position = Asignation.new_position(to_go, @actual_position, @name, @color)
		else
			Asignation.invalid_movement
		end
	end
end

#Queen class has a validate_movement method. She could be moved in a straigth or diagonal direction, as many steps as desired 
class Queen < Piece
	def validate_movement(*to_go)
		if Direction.diagonal(to_go, @actual_position) or Direction.straight(to_go, @actual_position)
			@actual_position = Asignation.new_position(to_go, @actual_position, @name, @color)

		else
			Asignation.invalid_movement
		end
	end
end

#Rook classd defines a validate_movement method. The rook could be moved in any number of steps but only in straight direction
class Rook < Piece
	def validate_movement(*to_go)
		if  Direction.straight(to_go, @actual_position)
			@actual_position = Asignation.new_position(to_go, @actual_position, @name, @color)
		else
			Asignation.invalid_movement
		end
	end
end

#Bishop class has a validate_movement method. It could be moved in any number of steps but only in straight direction
class Bishop < Piece
	def validate_movement(*to_go)
		if Direction.diagonal(to_go, @actual_position)
			@actual_position = Asignation.new_position(to_go, @actual_position, @name, @color)
		else
			Asignation.invalid_movement
		end
	end
end

#Horse class defines a validate_movement method. It moves describing and L, two steps in one axis and one in the other axis
class Horse < Piece
	def validate_movement(*to_go)
		if Direction.horse(to_go, @actual_position)
			@actual_position = Asignation.new_position(to_go, @actual_position, @name, @color)
		else
			Asignation.invalid_movement
		end
	end
end

#Pawn class
class Pawn < Piece
	def validate_movement(*to_go)
		if Direction.pawn_normal(to_go, @actual_position)
			@actual_position = Asignation.new_position(to_go, @actual_position, @name, @color)
		else
			Asignation.invalid_movement
		end
	end
end





black_rook1 = Rook.new("Tower", "Black", 0, 0)
black_bishop1 = Bishop.new("Bishop", "Black", 0, 0)
black_queen= Queen.new("Reina del arroz con pollo","Black",0,0)
black_horse1 = Horse.new("Cabashito", "Black", 0, 0)
black_pawn1 = Pawn.new("The programmer", "Black", 0, 0)
black_pawn1.validate_movement(0,0)
black_pawn1.validate_movement(1,0)
black_pawn1.validate_movement(1,3)
black_pawn1.validate_movement(-1,1)








