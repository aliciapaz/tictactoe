#!/usr/bin/env ruby

require './lib/board_info'
require './lib/player_info'
require './lib/game_logic'

board_info = BoardInfo.new
player_info = PlayerInfo.new
game = TicTacToe.new(board_info, player_info)

# rubocop:disable, Style/GuardClause, Metrics/AbcSize

public

def display_board
  puts "
  | #{board.memory[0]} | #{board.memory[1]} | #{board.memory[2]} |
  -------------
  | #{board.memory[3]} | #{board.memory[4]} | #{board.memory[5]} |
  -------------
  | #{board.memory[6]} | #{board.memory[7]} | #{board.memory[8]} |\n
  "
  display_player_board
end

def display_player_board
  puts "
  | #{board.player_board[0]} | #{board.player_board[1]} | #{board.player_board[2]} |
  -------------
  | #{board.player_board[3]} | #{board.player_board[4]} | #{board.player_board[5]} |
  -------------
  | #{board.player_board[6]} | #{board.player_board[7]} | #{board.player_board[8]} |\n
  "
end

# INPUT Players name

def input_player_name
  puts 'Please Enter Name Here: '
  player.player.size.times do |i|
    puts "Player #{i + 1} what is your name: "
    player.player[i][:name] = gets.chomp
    puts "Player #{i + 1} name: #{player.player[i][:name]} "
  end
end

# Coin Flipper to determine what player goes first
def coin_flipper
  randome_number = rand(1..100)
  puts 'Flipping Coin'
  puts '.............'
  puts '.............'
  puts '.............'
  if randome_number.even?
    puts "#{player.player[0][:name]} Starts First"
  else
    puts "#{player.player[1][:name]} Starts First"
    player.player.reverse!
  end
  @current_player = player.player[0]
end

def player_input
  puts @current_player[:name]
  puts 'Please input number between (1-9)'
  @location = gets.chomp
  @error_input = false
  if !@location.to_i.between?(1, 9)
    puts 'ERROR: Please enter number between 1-9'
    @error_input = true
  elsif board.memory[@location.to_i - 1] == ' '
    puts 'ERROR: Position taken, try again. Check available positions:'
    @error_input = true
  end
  @error_input
end

def tic_tac_toe
  while board.memory.any?(Integer) && !win_check
    player_input
    board_update
    win_check
    if win_check
      display_board
      puts "Congratulations #{@current_player[:name]} : YOU WON!!!!!"
      @current_player[:score] += 1
      break
    end
    if !win_check && board.memory.none?(Integer)
      display_board
      puts "It's a tie"
      break
    end
    display_board
    switch_player
  end


end

def restart_game
  check_restart = ''
  puts 'Play again? (y/n)'
  check_restart = gets.chomp
  if check_restart == 'y'
    board_reset
  return true 
  elsif
     check_restart == 'n'
     return false
  
  else
    
  end
  # add condition for error input
end


def game_round
  coin_flipper
  display_board
  tic_tac_toe 
end


game.input_player_name
game.game_round
while game.restart_game == true do game.game_round end

# rubocop:enable, Style/GuardClause, Metrics/AbcSize

