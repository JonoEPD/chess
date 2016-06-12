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
  end
end
