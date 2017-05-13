require_relative 'chess'

puts 'Do you want to load a game? (y/n)'
answer = gets.chomp
if answer.downcase == "y"
	game = load_game
else
	game = Chess.new
end

turns = 0

while true
	game.show_board

	if turns > 0
		puts "Do you want to save the game? (y/n)"
		answer = gets.chomp
		if answer.downcase == "y"
			game.save
		end
	end

	if game.check?
		puts 'Check!'
	end

	game.choose_piece
	game.move

	if game.checkmate
		puts "Checkmate! #{game.current_player} wins."
		game.show_board
		exit
	end

	if game.draw?
		puts "Draw."
		puts game.draw_message
		game.show_board
		exit
	end

	game.swap_players
	turns += 1
end