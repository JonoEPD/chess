module Piece
  class Knight < Base
    def type
      "N"
    end

    def can_jump?
      true
    end

    def legal?(finish)
      s_col,s_row = cr
      f_col,f_row = pos_to_cr(finish)
      diff_col = (s_col - f_col).abs
      diff_row = (s_row - f_row).abs
      (diff_col == 1 && diff_row == 2) || (diff_col == 2 && diff_row == 1)
    end

    def moves(board)
      arr = []
      col,row = cr
      # row 2 col 1
      if (row < 6 && col < 7)
        c_move = pos+17
        if(!board[c_move] || (board[c_move].side != side))
          arr.push(c_move)
        end
      end
      # row 2 col -1
      if (row < 6 && col > 0)
        c_move = pos+15
        if(!board[c_move] || (board[c_move].side != side))
          arr.push(c_move)
        end
      end
      # row 1 col 2
      if (row < 7 && col < 6)
        c_move = pos+10
        if(!board[c_move] || (board[c_move].side != side))
          arr.push(c_move)
        end
      end
      # row 1 col -2
      if (row < 7 && col > 1)
        c_move = pos+6
        if(!board[c_move] || (board[c_move].side != side))
          arr.push(c_move)
        end
      end
      # row -1 col 2
      if (row > 0 && col < 6)
        c_move = pos-6
        if(!board[c_move] || (board[c_move].side != side))
          arr.push(c_move)
        end
      end
      # row -1 col -2
      if (row > 0 && col > 1)
        c_move = pos-10
        if(!board[c_move] || (board[c_move].side != side))
          arr.push(c_move)
        end
      end
      # row -2 col 1
      if (row > 1 && col < 7)
        c_move = pos-15
        if(!board[c_move] || (board[c_move].side != side))
          arr.push(c_move)
        end
      end
      # row -2 col -1
      if (row > 1 && col > 0)
        c_move = pos-17
        if(!board[c_move] || (board[c_move].side != side))
          arr.push(c_move)
        end
      end
      arr
    end
  end
end
