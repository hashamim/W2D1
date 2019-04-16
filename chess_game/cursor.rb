require "io/console"
require_relative "board.rb"
KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board, :selected

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected = false
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  def toggle_selected
    @selected = !@selected 
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    case key
    when :space, :return
      if selected == false && @board[@cursor_pos] != NullPiece.instance
        toggle_selected
        return @cursor_pos
      elsif selected == true && @board[@cursor_pos] == NullPiece.instance
        toggle_selected
        return @cursor_pos
      end
    when :left
      update_pos([0,-1])
    when :down
      update_pos([1, 0])
    when :up
      update_pos([-1,0])
    when :right
      update_pos([0,1])
    when :tab, :escape
      if @selected 
        toggle_selected
      end
    when :newline

    when :backspace

    when :delete

    when :ctrl_c
      raise "CRTL + C"
    end
  end

  def update_pos(diff)
    possible_pos = [cursor_pos[0] + diff[0], cursor_pos[1] + diff[1]]
    @cursor_pos = possible_pos if valid_pos?(possible_pos) 
    nil     
  end
  def valid_pos?(pos)
    x, y = pos
    return x >= 0 && x <= 7 && y >= 0 && y <= 7
  end
end