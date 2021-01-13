#!/usr/bin/env ruby
# player : [player_one , player_two]
#  two symbols ][X,O] / player_point


# maybe_methods
# terns
# board =[0..8] memmory


class TicTacToe 
    

# build $memory = new array for(9, " ") 

    @@memory = Array.new(9," ")
  for i in 1..9 do
    @@memory[i-1] = i
  end

   @@player = [{:name=>'',:symbol => 'X',:score =>0 },
             {:name =>'', :symbol => "O", :score =>0}
  ]

   def display_board
    puts game_display = "
    | #{@@memory[0]} | #{@@memory[1]} | #{@@memory[2]} |
    -------------
    | #{@@memory[3]} | #{@@memory[4]} | #{@@memory[5]} |
    -------------
    | #{@@memory[6]} | #{@@memory[7]} | #{@@memory[8]} |\n
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


    # Find which player goies first
    # Input memory number to display player symbol
  

end

game = TicTacToe.new()
game.input_player_name
game.coin_flipper
# game.display_board
