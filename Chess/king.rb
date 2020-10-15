class King < Piece
    include stepable
    def symbol
        ♛.(color)
    end
    def move_diffs
        [[1,0],[-1,0],
         [0,1],[0,-1],
         [1,1],[-1,-1],
         [1,-1],[-1,1]]
    end
end