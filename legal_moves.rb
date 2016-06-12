require './board.rb'

class LegalMoves
  # hash table to hold list of generic possible moves
  def self.moves
    @@moves ||= {}.tap do |hash|
      (0..(Board.squares-1)).each do |s|
        pieces = [Pawn.new(s,0),Bishop.new(s,0),Knight.new(s,0),Rook.new(s,0),Queen.new(s,0),King.new(s,0)]
        pieces.each do |piece|
          arr = []
          (0..(Board.squares-1)).each do |f|
            arr.push(f) if piece.legal?(f)
          end
          hash[[piece.type,s]] = arr
        end
      end
    end
  end

  def special_moves
    @special ||= {}.tap do |hash|
      
    end
  end
end
