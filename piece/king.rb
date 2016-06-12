module Piece
  class King < Base
    def type
      "K"
    end

    def legal?(finish)
      return false unless pos != finish
      s_col,s_row = cr
      f_col,f_row = pos_to_cr(finish)
      diff_col = (s_col - f_col).abs
      diff_row = (s_row - f_row).abs
      diff_col <= 1 && diff_row <= 1
    end


    # copy of queen
    # while changed to if and breaks removed
    def moves(board)
 arr = []
      # row up
      c_move = pos+8
      if(c_move < 64)
        if(!board[c_move])
          arr.push(c_move)
          c_move += 8
        else
          # push if it's a capture. 
          arr.push(c_move) if board[c_move].side != side
        end
      end
      # row down
      c_move = pos-8
      if(c_move >= 0)
        if(!board[c_move])
          arr.push(c_move)
          c_move -= 8
        else
          arr.push(c_move) if board[c_move].side != side
        end
      end
      # col up
      c_move = pos+1
      if(c_move % 8 != 0)
        if(!board[c_move])
          arr.push(c_move)
          c_move += 1
        else
          arr.push(c_move) if board[c_move].side != side
        end
      end

      # col down
      c_move = pos-1
      if(c_move % 8 != 7)
        if(!board[c_move])
          arr.push(c_move)
          c_move += 1
        else
          arr.push(c_move) if board[c_move].side != side
        end
      end
      # row up col up
      c_move = pos+9
      if(c_move < 64 && c_move % 8 != 0)
        if(!board[c_move])
          arr.push(c_move)
          c_move += 9
        else
          # push if it's a capture. 
          arr.push(c_move) if board[c_move].side != side
        end
      end
      # row down col up
      c_move = pos-7
      if(c_move >= 0 && c_move % 8 != 0)
        if(!board[c_move])
          arr.push(c_move)
          c_move -= 7
        else
          arr.push(c_move) if board[c_move].side != side
        end
      end
      # row up col down
      c_move = pos+7
      if(c_move < 64 && c_move % 8 != 7)
        if(!board[c_move])
          arr.push(c_move)
          c_move += 7
        else
          arr.push(c_move) if board[c_move].side != side
        end
      end

      # row down col down
      c_move = pos-9
      if(c_move >= 0 && c_move % 8 != 7)
        if(!board[c_move])
          arr.push(c_move)
          c_move -= 9
        else
          arr.push(c_move) if board[c_move].side != side
        end
      end
      arr
    end
  end
end
