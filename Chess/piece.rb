
#create module for Slide and Stepable HERE 

#stepable - implement moves but needs to know what direction a piece can 
    #move in 
require_relative 'slideable'
require_relative 'stepable'

class Piece
    include Stepable
    include Slideable
    attr_reader :board, :color
    attr_accessor :pos, :symbol
    def initialize(color, board, pos)
        @board = board
        @color = color
        @pos = pos
    end

    #will need color bc will determine logic for moves 
    def empty?
        false
    end

    def to_s
        "#{symbol}"
    end
end

