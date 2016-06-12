require './piece.rb'

class Board
  # make this a PEN or something once the program is more developed
  def initialize(array = nil)
    @board = array || setup_board
  end

  def self.squares
    64
  end

  attr_accessor :board

  def setup_board
    Array.new(64)
  end

  def add(piece,pos)
    Array[pos] = piece #removes old piece if it exists
  end

  def move(start, finish)
    Array[start] = Array[finish]
  end
end


