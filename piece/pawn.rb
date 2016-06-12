module Piece
  class Pawn < Base
    def type
      "P"
    end

    def move(pos)
      @has_moved = true
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
  end

end
