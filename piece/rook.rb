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
  end
end
