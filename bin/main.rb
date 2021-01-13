#!/usr/bin/env ruby
# player : [player_one , player_two]
#  two symbols ][X,O] / player_point

# maybe_methods
# terns
# board =[0..8] memmory

class TicTacToe
  # build $memory = new array for(9, " ")

  @@memmory = Array.new(9, " ")
  for i in 1..9 do
    @@memmory[i - 1] = i
  end

  @@player = [{ :name => '', :symbol => 'X', :score => 0 },
              { :name => '', :symbol => "O", :score => 0 }]

  def display_board
    puts game_display = "
    | #{@@memmory[0]} | #{@@memmory[1]} | #{@@memmory[2]} |
    -------------
    | #{@@memmory[3]} | #{@@memmory[4]} | #{@@memmory[5]} |
    -------------
    | #{@@memmory[6]} | #{@@memmory[7]} | #{@@memmory[8]} |\n
    "
  end

  # INPUT Players name (@@player[i])
  def input_player_name
    puts "Please Enter Name Here: "
    @@player.size.times do |i|
      puts "Player #{i + 1} what is your name: "
      @@player[i][:name] = gets.chomp
      puts "Player #{i + 1} name: #{@@player[i][:name]} "
    end
  end

  # Coin Flipper to determine what player goes first
  def coin_flipper
    @@randome_number = rand(1..100)
    puts "Flipping Coin"
    puts "............."
    puts "............."
    puts "............."
    if @@randome_number.even?
      puts "#{@@player[0][:name]} Starts First"
    else puts "#{@@player[1][:name]} Starts First"
         @@player.reverse!
    end
    @@current_player = @@player[0]
  end

  def player_input
    puts "Please input number between (1-9)"
    @@location = gets.chomp
    unless @@location.to_i.between?(1, 9)
      puts "ERROR: Please enter number between 1-9"
    end
  end

  def board_update
    @@memmory[@@location.to_i - 1] = @@current_player[:symbol]
  end

  def switch_player
    @@current_player = (@@current_player == @@player.first) ? @@player.last : @@player.first
  end

  def win_check
    @@winner_check = false
    if [@@memmory[0], @@memmory[1], @@memmory[2]].uniq.join == @@current_player[:symbol] ||
       [@@memmory[3], @@memmory[4], @@memmory[5]].uniq.join == @@current_player[:symbol] ||
       [@@memmory[6], @@memmory[7], @@memmory[8]].uniq.join == @@current_player[:symbol] ||
       [@@memmory[0], @@memmory[3], @@memmory[6]].uniq.join == @@current_player[:symbol] ||
       [@@memmory[1], @@memmory[4], @@memmory[7]].uniq.join == @@current_player[:symbol] ||
       [@@memmory[2], @@memmory[5], @@memmory[8]].uniq.join == @@current_player[:symbol] ||
       [@@memmory[0], @@memmory[4], @@memmory[8]].uniq.join == @@current_player[:symbol] ||
       [@@memmory[6], @@memmory[4], @@memmory[2]].uniq.join == @@current_player[:symbol] ||
       @@winner_check = true
      puts "There is a winner"
    end
    @@winner_check
  end

  def memmory_check
    @@memmory.any?(Integer)
  end

  def tic_tac_toe
    9.times do
      if game.memmory_check && !game.win_check
        game.player_input
        game.board_update(i)
        game.display_board
      end
    end
  end
end

game = TicTacToe.new()
game.input_player_name
game.coin_flipper
game.player_input
game.board_update
game.display_board
