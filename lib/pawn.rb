
class Pawn
	attr_accessor :symbol, :colour, :position, :possible_moves

	def initialize colour,position
		@colour = colour
		@position = position			# The position is going to look like [5,6] which represents the 5 row and 6 column
		if @colour == :white
			@symbol = "\u2659"
		elsif @colour == :black
			@symbol = "\u265F"
		end

		@possible_moves = []
	end

	# Create an array with all possible moves such as [[3,3],[4,5], etc.] 
	def possible_moves board,position=self.position
		hor = position[0].to_i
		ver = position[1].to_i
		@possible_moves = []

		if self.colour == :white
			@possible_moves.push [hor-1,ver] if board[hor-1][ver] == " "
			@possible_moves.push [hor-2,ver] if hor == 7 && board[hor-2][ver] == " "
			@possible_moves.push [hor-1,ver-1] if board[hor-1][ver-1].respond_to?(:colour) && board[hor-1][ver-1].colour != self.colour
			@possible_moves.push [hor-1,ver+1] if board[hor-1][ver+1].respond_to?(:colour) && board[hor-1][ver+1].colour != self.colour
		elsif self.colour == :black
			@possible_moves.push [hor+1,ver] if board[hor+1][ver] == " "
			@possible_moves.push [hor+2,ver] if hor == 2 && board[hor+2][ver] == " "
			@possible_moves.push [hor+1,ver-1] if board[hor+1][ver-1].respond_to?(:colour) && board[hor+1][ver-1].colour != self.colour
			@possible_moves.push [hor+1,ver+1] if board[hor+1][ver+1].respond_to?(:colour) && board[hor+1][ver+1].colour != self.colour
		end
		@possible_moves
	end
end
