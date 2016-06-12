module Piece
  class Base
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

    def move(pos)
      @pos = pos
    end

    attr_reader :pos, :side
  end
end


