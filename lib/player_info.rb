# require "./bin/main.rb"

class PlayerInfo
  attr_accessor :player

  def initialize
    @player = [{ name: '', symbol: 'X', score: 0 },
               { name: '', symbol: 'O', score: 0 }]
  end
end
