module Piece
  class Rook < Base
    def type
      "R"
    end

    def legal?(finish)
      return false unless pos != finish
      s_col,s_row = cr
      f_col,f_row = pos_to_cr(finish)
      (s_col == f_col) ^ (s_row == f_row)
    end

    def moves(board)
      arr = []
      # row up
      c_move = pos+8
      while(c_move < 64)
        if(!board[c_move])
          arr.push(c_move)
          c_move += 8
        else
          # push if it's a capture. 
          arr.push(c_move) if board[c_move].side != side
          break
        end
      end
      # row down
      c_move = pos-8
      while(c_move >= 0)
        if(!board[c_move])
          arr.push(c_move)
          c_move -= 8
        else
          arr.push(c_move) if board[c_move].side != side
          break
        end
      end
      # col up
      c_move = pos+1
      while(c_move % 8 != 0)
        if(!board[c_move])
          arr.push(c_move)
          c_move += 1
        else
          arr.push(c_move) if board[c_move].side != side
          break
        end
      end

      # col down
      c_move = pos-1
      while(c_move % 8 != 7)
        if(!board[c_move])
          arr.push(c_move)
          c_move += 1
        else
          arr.push(c_move) if board[c_move].side != side
          break
        end
      end
      arr
    end
  end
end
