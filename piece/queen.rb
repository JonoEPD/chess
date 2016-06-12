module Piece
  class Queen < Base
    def type
      "Q"
    end

    def legal?(finish)
      return false unless pos != finish
      s_col,s_row = cr
      f_col,f_row = pos_to_cr(finish)
      diff_col = (s_col - f_col).abs
      diff_row = (s_row - f_row).abs
      ((s_col == f_col) ^ (s_row == f_row)) || (diff_col == diff_row)
    end
  end
end
