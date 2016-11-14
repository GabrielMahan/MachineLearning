require_relative 'data_management'

response = nil
until response == 'q'

	puts "Press (Q) to quit, (P) to play, (T) to train, (V) to view data, (D) to wipe data"
	response = gets.chomp.strip

	if response == 'p'
		play_game
	elsif response == 't'
		puts "how games do you want the computer to train???"
		response_number = gets.chomp.to_i
		train(response_number)
	elsif response == 'v'
		p $data
	elsif response == 'd'
		$data = {}
		puts "DATA IS WIPED!!! Last chance now to hit ctrl+c before your data is saved"
	end
end



puts "Data successfully saved" if save
