#!/usr/bin/env ruby
# require_relative "board_info"
#  require_relative 'board_info'
 require "./lib/board_info.rb"

# rubocop:disable Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/GuardClause, Metrics/AbcSize

class TicTacToe
  # build $memory = new array for(9, " ")
  attr_accessor :board 
  
  
  def initialize(my_board)
    self.board = my_board
  end

def board_memory
      board.memory
end

def player_board
   board.player_board
end


  @@player = [{ name: '', symbol: 'X', score: 0 },
              { name: '', symbol: 'O', score: 0 }]

  def display_board
    puts "
    | #{board.memory[0]} | #{board.memory[1]} | #{board.memory[2]} |
    -------------
    | #{board.memory[3]} | #{board.memory[4]} | #{board.memory[5]} |
    -------------
    | #{board.memory[6]} | #{board.memory[7]} | #{board.memory[8]} |\n
    "
    puts "
    | #{board.player_board[0]} | #{board.player_board[1]} | #{board.player_board[2]} |
    -------------
    | #{board.player_board[3]} | #{board.player_board[4]} | #{board.player_board[5]} |
    -------------
    | #{board.player_board[6]} | #{board.player_board[7]} | #{board.player_board[8]} |\n
    "
  end

  # INPUT Players name (@@player[i])
  def input_player_name
    puts 'Please Enter Name Here: '
    @@player.size.times do |i|
      puts "Player #{i + 1} what is your name: "
      @@player[i][:name] = gets.chomp
      puts "Player #{i + 1} name: #{@@player[i][:name]} "
    end
  end

  # Coin Flipper to determine what player goes first
  def coin_flipper
    @@randome_number = rand(1..100)
    puts 'Flipping Coin'
    puts '.............'
    puts '.............'
    puts '.............'
    if @@randome_number.even?
      puts "#{@@player[0][:name]} Starts First"
    else
      puts "#{@@player[1][:name]} Starts First"
      @@player.reverse!
    end
    @@current_player = @@player[0]
  end

  def player_input
    puts @@current_player[:name]
    puts 'Please input number between (1-9)'
    @@location = gets.chomp
    @error_input = false
    if !@@location.to_i.between?(1, 9)
      puts 'ERROR: Please enter number between 1-9'
      @error_input = true
    elsif board_info.memory[@@location.to_i - 1] == ' '
      puts 'ERROR: Position taken, try again.'
      @error_input = true
    end
    @error_input
  end

  def board_update
    unless @error_input
      board_info.memory[@@location.to_i - 1] = ' '
      board_info.player_board[@@location.to_i - 1] = @@current_player[:symbol]
    end
  end

  def switch_player
    unless @error_input
      @@current_player = @@current_player == @@player.first ? @@player.last : @@player.first
    end
  end

  def win_check
    @@winner_check = false
    if [board_info.player_board[0], board_info.player_board[1], board_info.player_board[2]].uniq.join == @@current_player[:symbol] ||
       [board_info.player_board[3], board_info.player_board[4], board_info.player_board[5]].uniq.join == @@current_player[:symbol] ||
       [board_info.player_board[6], board_info.player_board[7], board_info.player_board[8]].uniq.join == @@current_player[:symbol] ||
       [board_info.player_board[0], board_info.player_board[3], board_info.player_board[6]].uniq.join == @@current_player[:symbol] ||
       [board_info.player_board[1], board_info.player_board[4], board_info.player_board[7]].uniq.join == @@current_player[:symbol] ||
       [board_info.player_board[2], board_info.player_board[5], board_info.player_board[8]].uniq.join == @@current_player[:symbol] ||
       [board_info.player_board[0], board_info.player_board[4], board_info.player_board[8]].uniq.join == @@current_player[:symbol] ||
       [board_info.player_board[6], board_info.player_board[4], board_info.player_board[2]].uniq.join == @@current_player[:symbol]
      @@winner_check = true
    end
    @@winner_check
  end

  def tic_tac_toe
    while board_info.memory.any?(Integer) && !win_check
      player_input
      board_update
      win_check
      if win_check
        display_board
        puts "Congratulations #{@@current_player[:name]} : YOU WON!!!!!"
        break
      end
      display_board
      switch_player

    end
  end
end

board_info = BoardInfo.new



game = TicTacToe.new(board_info)
game.input_player_name
game.coin_flipper
game.display_board
game.tic_tac_toe

# rubocop:enable Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/GuardClause, Metrics/AbcSize
