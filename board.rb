require './piece/base.rb'
Dir["./piece/*.rb"].each { |file| require file }

class Board
  # make this a PEN or something once the program is more developed
  def initialize(array = nil)
    pieces
    setup_board
  end

  def self.squares
    64
  end

  attr_accessor :board

  def [](pos)
    @board[pos]
  end

  def []=(pos,piece)
    @board[pos] = piece
  end

  def setup_board
    @board = Array.new(64)
    @pieces.each do |piece|
      board[piece.pos] = piece
    end
  end

  def add(piece,pos)
    Array[pos] = piece #removes old piece if it exists
  end

  def move(start, finish)
    Array[start] = Array[finish]
  end

  def pieces
    # white pieces
    @pieces ||= [].tap do |arr| 
      arr.push(Piece::Rook.new(0,0), Piece::Knight.new(1,0), Piece::Bishop.new(2,0),
               Piece::Queen.new(3,0), Piece::King.new(4,0), Piece::Bishop.new(5,0),
               Piece::Knight.new(6,0), Piece::Rook.new(7,0))
      # white pawns
      (0..7).each do |col|
        arr.push(Piece::Pawn.new(8+col,0))
      end
      arr.push(Piece::Rook.new(63,1), Piece::Knight.new(62,1),
               Piece::Bishop.new(61,1), Piece::King.new(60,1),
               Piece::Queen.new(59,1), Piece::Bishop.new(58,1),
               Piece::Knight.new(57,1), Piece::Rook.new(56,1))
      (0..7).each do |col|
        arr.push(Piece::Pawn.new(56-col,1))
      end
    end
  end
end


