#!/usr/bin/env ruby
# player : [player_one , player_two]
#  two symbols ][X,O] / player_point


# maybe_methods
# terns
# board =[0..8] memmory


class TicTacToe 
    

# build $memory = new array for(9, " ") 

    @@memmory = Array.new(9," ")
  for i in 1..9 do
    @@memmory[i-1] = i
  end

   @@player = [{:name=>'',:symbol => 'X',:score =>0 },
             {:name =>'', :symbol => "O", :score =>0}
  ]

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
     puts "Player #{i+1} what is your name: " 
     @@player[i][:name] = gets.chomp
     puts "Player #{i+1} name: #{@@player[i][:name]} "
    end
end

# Coin Flipper to determine what player goes first
  def coin_flipper
    @@randome_number =  rand(1..100)
    puts "Flipping Coin"
    puts "............."
    puts "............."
    puts "............."
      if @@randome_number.even?  
           puts "#{@@player[0][:name]} Starts First" 
      else puts "#{@@player[1][:name]} Starts First" 
           @@player.reverse!
      end
   end

  def player_input 
      puts "Please input number between (1-9)"
      @@location = gets.chomp
      unless @@location.to_i.between?(1,9)
        puts "ERROR: Please enter number between 1-9"
      end
  end


   def board_update
       @@memmory[@@location.to_i - 1] = @@player[0][:symbol]      
    end
   
    def switch_player

      
       #  if player[i] input @@location 
              #  if memmory not full 
              #   Or if there is a winner
              #  update board 
              # display updated board
        #  Switch to player[i+1] iput @@location
   
   
      end

end

game = TicTacToe.new()
game.input_player_name
game.coin_flipper
game.player_input
game.board_update
game.display_board
