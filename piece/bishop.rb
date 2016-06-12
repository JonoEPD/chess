module Piece
  class Bishop < Base
    def type
      "B"
    end

    def legal?(finish)
      return false unless pos != finish
      s_col,s_row = cr
      f_col,f_row = pos_to_cr(finish)
      diff_col = (s_col - f_col).abs
      diff_row = (s_row - f_row).abs
      diff_col == diff_row
    end

    def moves(board)
      arr = []
      # row up col up
      c_move = pos+9
      while(c_move < 64 && c_move % 8 != 0)
        if(!board[c_move])
          arr.push(c_move)
          c_move += 9
        else
          # push if it's a capture. 
          arr.push(c_move) if board[c_move].side != side
          break
        end
      end
      # row down col up
      c_move = pos-7
      while(c_move >= 0 && c_move % 8 != 0)
        if(!board[c_move])
          arr.push(c_move)
          c_move -= 7
        else
          arr.push(c_move) if board[c_move].side != side
          break
        end
      end
      # row up col down
      c_move = pos+7
      while(c_move < 64 && c_move % 8 != 7)
        if(!board[c_move])
          arr.push(c_move)
          c_move += 7
        else
          arr.push(c_move) if board[c_move].side != side
          break
        end
      end

      # row down col down
      c_move = pos-9
      while(c_move >= 0 && c_move % 8 != 7)
        if(!board[c_move])
          arr.push(c_move)
          c_move -= 9
        else
          arr.push(c_move) if board[c_move].side != side
          break
        end
      end
      arr
    end
  end
end
