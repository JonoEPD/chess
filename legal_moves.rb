require './board.rb'

# hash table to hold list of possible moves 
class LegalMoves
  def self.moves
    @@moves ||= {}.tap do |hash|
      (0..(Board.squares-1)).each do |s|
        pieces = [Bishop.new(s,0),Knight.new(s,0),Rook.new(s,0),Queen.new(s,0),King.new(s,0)]
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
end
