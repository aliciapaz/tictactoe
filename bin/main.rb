#!/usr/bin/env ruby

# rubocop:disable Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/GuardClause

class TicTacToe
  # build $memory = new array for(9, " ")

  @@memmory = Array.new(9, ' ')
  (1..9).each do |i|
    @@memmory[i - 1] = i
  end

  @@player_board = Array.new(9, ' ')
  (1..9).each do |i|
    @@player_board[i - 1] = ' '
  end

  @@player = [{ name: '', symbol: 'X', score: 0 },
              { name: '', symbol: 'O', score: 0 }]

  def display_board
    puts "
    | #{@@memmory[0]} | #{@@memmory[1]} | #{@@memmory[2]} |
    -------------
    | #{@@memmory[3]} | #{@@memmory[4]} | #{@@memmory[5]} |
    -------------
    | #{@@memmory[6]} | #{@@memmory[7]} | #{@@memmory[8]} |\n
    "
    puts "
    | #{@@player_board[0]} | #{@@player_board[1]} | #{@@player_board[2]} |
    -------------
    | #{@@player_board[3]} | #{@@player_board[4]} | #{@@player_board[5]} |
    -------------
    | #{@@player_board[6]} | #{@@player_board[7]} | #{@@player_board[8]} |\n
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
    @@error_input = false
    if !@@location.to_i.between?(1, 9)
      puts 'ERROR: Please enter number between 1-9'
      @@error_input = true
    elsif @@memmory[@@location.to_i - 1] == ' '
      puts 'ERROR: Position taken, try again.'
      @@error_input = true
    end
    @@error_input
  end

  def board_update
    unless @@error_input
      @@memmory[@@location.to_i - 1] = ' '
      @@player_board[@@location.to_i - 1] = @@current_player[:symbol]
    end
  end

  def switch_player
    unless @@error_input
      @@current_player = @@current_player == @@player.first ? @@player.last : @@player.first
    end
  end

  def win_check
    @@winner_check = false
    if [@@player_board[0], @@player_board[1], @@player_board[2]].uniq.join == @@current_player[:symbol] ||
       [@@player_board[3], @@player_board[4], @@player_board[5]].uniq.join == @@current_player[:symbol] ||
       [@@player_board[6], @@player_board[7], @@player_board[8]].uniq.join == @@current_player[:symbol] ||
       [@@player_board[0], @@player_board[3], @@player_board[6]].uniq.join == @@current_player[:symbol] ||
       [@@player_board[1], @@player_board[4], @@player_board[7]].uniq.join == @@current_player[:symbol] ||
       [@@player_board[2], @@player_board[5], @@player_board[8]].uniq.join == @@current_player[:symbol] ||
       [@@player_board[0], @@player_board[4], @@player_board[8]].uniq.join == @@current_player[:symbol] ||
       [@@player_board[6], @@player_board[4], @@player_board[2]].uniq.join == @@current_player[:symbol]
      @@winner_check = true
      puts 'There is a winner'
    end
    @@winner_check
  end

  def memmory_check
    @@memmory.any?(Integer)
  end

  def tic_tac_toe
    9.times do
      next unless win_check == false && memmory_check == true

      # unless self.memmory_check && !self.win_check
      player_input
      board_update
      display_board
      switch_player
    end
  end
end

game = TicTacToe.new
game.input_player_name
game.coin_flipper
game.display_board
game.tic_tac_toe
# 9.times do
#   game.player_input
#   game.switch_player
#   game.board_update
#   game.display_board
# end

# rubocop:enable Style/ClassVars, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/GuardClause
