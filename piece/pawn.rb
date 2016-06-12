module Piece
  class Pawn < Base
    def type
      "P"
    end

    def move(pos)
      @moved = true
      super(pos)
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
      if(@side == 0) #white
        c_pos = pos + 8
        if(!board[c_pos] && c_pos < Board.squares)
          arr.push(c_pos)
          if(!@moved)
            c_pos += 8
            if(!board[c_pos] && c_pos < Board.squares)
              arr.push(c_pos)
            end
          end
        end
      elsif(@side == 1) #black
        c_pos = pos - 8
        if(!board[c_pos] && c_pos >= 0)
          arr.push(c_pos)
          if(!@moved)
            c_pos -= 8
            if(!board[c_pos] && c_pos < Board.squares)
              arr.push(c_pos)
            end
          end
        end
      end
      arr
    end
  end
end
