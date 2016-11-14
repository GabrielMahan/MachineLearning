$data = File.open("test.marshal", "r") { |from_file| Marshal.load(from_file) } || {}
require_relative 'game'

def play_training_match
	g = Game.new
	g.auto_play

	case g.winner
	when 'WIN'
		weight_moves(g, 10)

		winning_move = g.moves.last
		$data[winning_move[:board]][winning_move[:move]] = 'WINNING MOVE'

	when 'CATS'
		weight_moves(g, 1)
	end

end

def weight_moves(game, weight)
	game.moves.each do |move|
		if $data[move[:board]]
			if $data[move[:board]][move[:move]]
				$data[move[:board]][move[:move]] += weight if $data[move[:board]][move[:move]].is_a?(Numeric)
			else
				$data[move[:board]][move[:move]] = weight
			end
		else
			$data[move[:board]] = { move[:move] => weight }
		end
	end
end


def save
	File.open("test.marshal", "w"){|to_file| Marshal.dump($data, to_file)}
end


def train(n)
	n.times { play_training_match }
end

def play_game
	fun_game = Game.new
	fun_game.fun_play
end
