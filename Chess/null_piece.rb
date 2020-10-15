require 'singleton'
class NullPiece < Piece 
    include Singleton
    def initialize
        @color = ""
        @symbol = ""
    end

    def empty?
        true
    end

    def moves
        []
    end
end