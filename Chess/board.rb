require_relative "piece"
require_relative "null_piece"
require_relative "pawn"
require_relative 'display'


class Board
    attr_accessor :grid
    def initialize
        @sentinel = NullPiece.instance
        initial_board
    end

    def initial_board #dont need this method 
        @grid = Array.new(8) {Array.new(8,@sentinel)} 
         (0...@grid.length).each do |row|
            (0...@grid.length).each do |j|
                if row == 0 || row == 1 || row == 6 || row == 7
                    @grid[row][j] = Piece.new(@color, self, [row,j])
                end
            end
        end
        @grid
    end
    
    
    def [](pos)
        raise 'Invalid Position' unless valid_pos?(pos)
        @grid[pos.first][pos.last]
        
    end

    def []=(pos, val)
        raise 'Invalid Position' unless valid_pos?(pos)
        @grid[pos.first][pos.last] = val
    end

    def valid_pos?(pos) 
        pos.all? { |coordinate| coordinate.between?(0,7) }
    end

    def move_piece(start_pos, end_pos) #piece vs not piece && color doesnt matter is end pos on board and is there a piece there when u start 
        raise 'No Piece' unless empty?(start_pos)
        piece = self[start_pos]
        # raise 'Not Your Piece!!' if piece.color != color
        
    end

    # def move_piece!(color, start_pos, end_pos)

    # end

    def empty?(pos)
        self[pos].empty?
    end

    # def add_piece(piece, pos)
    #     # self[pos] = piece
    # end

    def check_mate(color)

    end
    
    def in_check?(color) 
        kings_pos = find_king(color)
        pieces.any? { |p| if p.color != color && p.moves.include?(kings_pos) } 
    end

    def find_king(color) 
        pieces.select { |p| p.is_a?(King) && p.color == color }
    end

    def pieces
        @board.flatten.select{|ele| ele != NullPiece.instance}
    end

    # def dup
    #     # @board.dup
    # end
    

end



#------------------------

    # def init_board #dont need this method 
    #     initial_board = Array.new(8) {Array.new(8,@sentinel)} 
    #     [:black, :white].each do |color|
    #         set_back_row(color) 
    #         set_front_row(color) 
    #     end
    #     initial_board
    # end
    
    # def set_back_row(color)  #just need to loop thru grid if were at index 0 1 6 7 grid[i][j] == Piece.new
    #     back_row = ['Rook', 'Knight', 'Bishop', 'Queen', 'King', 'Bishop', 'Knight', 'Rook']
    #     i = (color == :white) ? 7 : 0 
    #     back_row.each_with_index do |piece_new, j|
    #         @grid[i][j] = Piece.new(color, self, [i, j])
    #     end
    # end

    # def set_front_row(color)
    #     front_row = []
    #     8.times { front_row << 'Pawn'}
    #      i = (color == :white ) ? 1 : 6
    #      front_row.each_with_index do |piece_new, j|
    #         piece_new = Piece.new(color, self, [i, j])
    #      end
    # end

    b = Board.new

    disp = Display.new(b)

    disp.render



    # pawn = Pawn.new(:white, b, [1,0])

    # b[[2,0]] = pawn

    # p pawn.moves

