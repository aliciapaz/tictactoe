#!/usr/bin/env ruby
# player : [player_one , player_two]
#  two symbols ][X,O] / player_point


# maybe_methods
# terns
# board =[0..8] memmory


class TicTacToe 
    

    def initialize(play_one, player_two)
    @player_one = player_one
    @player_two = player_two
    end

    player = {:player_one => O,  :player_two => X}
    
    board_memmory = [0..8]
    

     
    def display_board
     puts   board_memmory[0]
    end

end

game = TicTacToe.new(player_one, player_two)
game.display_board
