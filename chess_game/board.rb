require_relative "piece"
class Board
    attr_reader :rows
    def initialize()
        @rows   = Array.new(8) { Array.new(8){ NullPiece.instance}}
        populate
    end
    def populate
        @rows.each_with_index do |row,i|
            row.each_with_index do |piece,j|
                if i == 1
                    self[[i,j]] = Pawn.new(:black,self,[i,j])
                end
                if i == 0 && (j == 0 || j == 7)
                    self[[i,j]] = Rook.new(:black,self,[i,j])
                end
                if i == 7 && (j == 0 || j == 7)
                    self[[i,j]] = Rook.new(:white,self,[i,j])
                end
                 if i == 0 && (j == 1 || j == 6)
                    self[[i,j]] = Knight.new(:black,self,[i,j])
                end
                 if i == 7 && (j == 1 || j == 6)
                    self[[i,j]] = Knight.new(:white,self,[i,j])
                end
                 if i == 7 && (j == 2 || j == 5)
                    self[[i,j]] = Bishop.new(:white,self,[i,j])
                end
                if i == 0 && (j == 2 || j == 5)
                    self[[i,j]] = Bishop.new(:black,self,[i,j])
                end
                if i == 0 && j == 4
                    self[[i,j]] = King.new(:black,self,[i,j])
                end
                if i == 7 && j == 4
                    self[[i,j]] = King.new(:white,self,[i,j])
                end
                if i == 0 && j == 3
                    self[[i,j]] = Queen.new(:black,self,[i,j])
                end
                if i == 7 && j == 3
                    self[[i,j]] = Queen.new(:white,self,[i,j])
                end
                if i == 6
                    self[[i,j]] = Pawn.new(:white,self,[i,j])
                end
            end
        end
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
        # raise "ERROR2" unless self[start_pos].valid_moves.include?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance
    end
end