class Game
	attr_accessor :board, :winner, :moves

	def initialize
		@board = '---------'.split('')
		@winner = 'CATS'
		@moves = [];
	end

	def done?
		win_indexes = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		win_indexes.each do |set|
			line = set.map { |i| board[i] }.join
			return 'WIN' if line == 'xxx'
			return 'LOSE' if line == 'ooo'
		end

		return 'CATS' unless board.index('-')
		return false
	end

	def smart_move
		if $data[board.join]
			winning_moves = $data[board.join].select { |k,v| v == 'WINNING MOVE'}.keys

			if !winning_moves.empty?
				board[winning_moves.first] = 'x'
			else
				move = $data[board.join].max_by { |move, weight| weight}.first.to_i
				board[move] = 'x'
			end
		else
			move('x')
		end

	end

	def move(letter)
		if board.index('-')
			i = rand(0..8)

			until board[i] == '-' do
				i = rand(0..8)
			end

			if letter == 'x'
				moves << {board: board.join, move: i}
			end
			board[i] = letter
		end
	end

	def auto_play
		until done? do
			move('x')
			move('o') unless done?
		end
		self.winner = done?
	end

	def fun_play
		until done? do
			smart_move

			if !done?
				puts "\n\n\n\n\n\n"
				puts board.each_slice(3).to_a.map(&:join).join("\n")

				player_move = nil
				until player_move && board[player_move] == '-'
					puts "At what inddo you want to make your move"
					player_move = gets.chomp.strip.to_i
				end

				board[player_move] = 'o'
			end
		end

		self.winner = done?

		if winner == 'WIN'
			puts "The computer won!!!"
		elsif winner == 'LOSE'
			puts 'You WON'
		else
			puts 'CATS GAME!!!'
		end
	end
end
