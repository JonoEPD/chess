class Piece
  # white = 0 black = 1
  def initialize(pos,side)
    @pos = pos
    @side = side
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

  def can_jump?
    false
  end

  def movement
    throw "define Piece#movement"
  end

  attr_reader :pos, :side
end

class NullPiece < Piece
  def type
    "Z"
  end

  def legal?(finish)
    false
  end
end

class Rook < Piece
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

class Bishop < Piece
  def type
    "B"
  end

  def legal?(finish)
    return false unless pos != finish
    s_col,s_row = cr
    f_col,f_row = pos_to_cr(finish)
    diff_col = (s_col - f_col).abs
    diff_row = (s_row - f_row).abs
    diff_col == diff_row
  end
end

class Queen < Piece
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

class King < Piece
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

class Pawn < Piece
  def type
    "P"
  end

  def legal?(finish)
    # same row? 
    s_col,s_row = cr
    f_col,f_row = pos_to_cr(finish)
    return false unless (s_row == f_row) 
  end

end

class Knight < Piece
  def type
    "N"
  end

  def legal?(finish)
    s_col,s_row = cr
    f_col,f_row = pos_to_cr(finish)
    diff_col = (s_col - f_col).abs
    diff_row = (s_row - f_row).abs
    (diff_col == 1 && diff_row == 2) || (diff_col == 2 && diff_row == 1)
  end
end
