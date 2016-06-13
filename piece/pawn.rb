module Piece
  class Pawn < Base
    def type
      "P"
    end

    def legal?(finish)
      return false unless pos != finish
      # same row? 
      s_col,s_row = cr
      f_col,f_row = pos_to_cr(finish)
      return false unless (s_row == f_row)
      if(@side == 0) #white
        f_col == (s_col + 1)
      elsif(@side == 1) #black
        s_col == (f_col + 1)
      end
    end

    def moves(board)
      arr = []
      s_col,s_row = cr
      # en passant
      if(board.last)
        bl = board.last
        l = board[bl[1]]
        l_col,l_row = pos_to_cr(l.pos)
        # piece is next to us, is a pawn, and just moved twice
        if(l.type == "P" && l_row == s_row && (bl[0] - bl[1]).abs == 16 && (
             s_col - l_col).abs == 1 )
          c_pos = b[2].pos + 8 * (side == 0 ? 1 : -1)
          arr.push(c_pos)
        end
      end

      if(@side == 0) #white
        c_pos = pos + 8
        if(!board[c_pos] && c_pos < Board.squares)
          arr.push(c_pos)
          if(!@moved)
            c_pos += 8
            if(!board[c_pos])
              arr.push(c_pos)
            end
          end
        end
        # add captures
        if(s_col != 0 && board[c_pos-1])
          arr.push(c_pos-1)
        end
        if(s_col != 7 && board[c_pos+1])
          arr.push(c_pos+1)
        end
      elsif(@side == 1) #black
        c_pos = pos - 8
        if(!board[c_pos] && c_pos >= 0)
          arr.push(c_pos)
          if(!@moved)
            c_pos -= 8
            if(!board[c_pos])
              arr.push(c_pos)
            end
          end
        end
        # add captures
        if(s_col != 0 && board[c_pos-1])
          arr.push(c_pos-1)
        end
        if(s_col != 7 && board[c_pos+1])
          arr.push(c_pos+1)
        end
      end
      arr
    end
  end
end
