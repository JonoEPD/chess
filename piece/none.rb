module Piece
  class None < Base
    def type
      "Z"
    end

    def legal?(finish)
      false
    end
  end
end
