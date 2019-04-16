require "colorize"
require_relative "board"
require_relative "cursor"
require_relative "pieces"
require "byebug"
class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
        @selected = [-1,-1]
    end
    def render
        puts ". A B C D E F G H"
        @board.rows.each_with_index do |row,i| 
            print "#{i + 1} "    
            row.each_with_index do |piece,j|
                if @selected == [i,j] && @cursor.selected
                    print " #{piece}".on_green
                elsif @cursor.cursor_pos == [i,j]
                    print " #{piece}".on_blue
                elsif (i + j).even?
                    print " #{piece}".on_light_white
                else
                    print " #{piece}".on_light_black
                end
            end
            puts
        end
    end
    def displayloop
        while true
            render
            # debugger
            a = @cursor.get_input
            if a && @cursor.selected
                @selected = a
            elsif a && !@cursor.selected
                @board.move_piece(:black,@selected,a)
            end
            # @selected = a if !a.nil? && @board[a] != NullPiece.instance && @cursor.selected == false
            # @board.move_piece(@board[@selected].color, @selected, a)

            system("clear")
        end
    end


end

def reload
    load "display.rb"
    Display.new(Board.new)
end
