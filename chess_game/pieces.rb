require_relative "piece.rb"
require "singleton"
class Rook < Piece

    def to_s
        if @color == :white
            Piece.encode_uni("\u2656")
        else
            Piece.encode_uni("\u265c").black
        end
    end
end

class Bishop < Piece

    def to_s
        if @color == :white
            Piece.encode_uni("\u2657")
        else
            Piece.encode_uni("\u265d").black
        end
    end
end
class Queen < Piece

    def to_s
        if @color == :white
            Piece.encode_uni("\u2655")
        else
            Piece.encode_uni("\u265b").black
        end
    end
end
class King < Piece

    def to_s
        if @color == :white
            Piece.encode_uni("\u2654")
        else
            Piece.encode_uni("\u265a").colorize(:black)
        end
    end
end
class Knight < Piece

    def to_s
        if @color == :white
            Piece.encode_uni("\u2658")
        else
            Piece.encode_uni("\u265e").colorize(:black)
        end
    end
end
class Pawn < Piece

    def to_s
        if @color == :white
            Piece.encode_uni("\u2659")
        else
            Piece.encode_uni("\u265f").black
        end
    end
end

class NullPiece < Piece
    include Singleton
    def initialize
        @color = :grey
    end

    def to_s
        " "
    end

end