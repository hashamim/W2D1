require "colorize"
class Piece
    attr_reader :color
    def initialize(color,board,pos)
        @color = color
        @board = board
        @pos = pos
    end
    def inspect
        self.to_s
    end
    def valid_moves
        []
    end
    def self.encode_uni(str)
        str.encode('utf-8')
    end
    def to_s
        char = Piece.encode_uni("\u2654").colorize(:black)
    end
end


