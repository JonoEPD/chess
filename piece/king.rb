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
  end
end
