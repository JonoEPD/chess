class Piece
  def initialize(pos)
    @pos = pos
  end

  # get array position from pair of integers
  def cr_to_pos(col,row)
    col + 8*row
  end

  def pos_to_cr(i)
    col = i%8
    row = (i-col)/8
    [col,row]
  end

  def cr
    pos_to_cr(pos)
  end

  def type
    throw "define Piece#type"
  end

  def movement
    throw "define Piece#movement"
  end

  attr_reader :pos
end

class NullPiece < Piece
  def type
    "Z"
  end
end

class Rook < Piece
  def type
    "R"
  end

  def legal?(f_piece)
    s_col,s_row = cr
    f_col,f_row = f_piece.cr
    (s_col == f_col) ^ (s_row == f_row)
  end
end
