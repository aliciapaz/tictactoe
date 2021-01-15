class TicTacToe
  attr_accessor :board, :player

  def initialize(my_board = nil, my_player = nil)
    self.board = my_board
    self.player = my_player
  end

  def board_memory
    board.memory
  end

  def player_board
    board.player_board
  end
   
  def board_reset
       board.board_reset
  end


  def player_info
    player.player
  end

  def switch_player
    return if @error_input

    @current_player = @current_player == player.player.first ? player.player.last : player.player.first
  end

  def board_update
    return if @error_input

    board.memory[@location.to_i - 1] = ' '
    board.player_board[@location.to_i - 1] = @current_player[:symbol]
  end

  def win_row
    return true if
      [board.player_board[0], board.player_board[1], board.player_board[2]].uniq.join == @current_player[:symbol] ||
      [board.player_board[3], board.player_board[4], board.player_board[5]].uniq.join == @current_player[:symbol] ||
      [board.player_board[6], board.player_board[7], board.player_board[8]].uniq.join == @current_player[:symbol]
  end

  def win_col
    return true if
      [board.player_board[0], board.player_board[3], board.player_board[6]].uniq.join == @current_player[:symbol] ||
      [board.player_board[1], board.player_board[4], board.player_board[7]].uniq.join == @current_player[:symbol] ||
      [board.player_board[2], board.player_board[5], board.player_board[8]].uniq.join == @current_player[:symbol]
  end

  def win_diag
    return true if
      [board.player_board[0], board.player_board[4], board.player_board[8]].uniq.join == @current_player[:symbol] ||
      [board.player_board[6], board.player_board[4], board.player_board[2]].uniq.join == @current_player[:symbol]
  end

  def win_check
    return true if win_row || win_col || win_diag
  end


end