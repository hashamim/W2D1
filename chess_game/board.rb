require_relative "piece"
class Board
    def initialize()
        @rows   = Array.new(8) {Array.new(8){Piece.new}}
    end
    def [](pos)
        x,y = pos
        @rows[x][y]
    end
    def []=(pos,val)
        x,y = pos
        @rows[x][y] = val
    end
    def move_piece(color,start_pos,end_pos)
        raise "ERRORRR1" if self[start_pos].nil?
        raise "ERROR2" unless self[start_pos].valid_moves.include?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end
end