require_relative 'cursor'

require 'colorize'
class Display
    attr_reader :board, :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def build_board
        @board.grid.map do |row|
            row.map.with_index do |ele|
                ele.to_s
            end
        end
        
    end

    def render
        self.build_board.each do |row|
            p row.join('')
        end
    end

end


