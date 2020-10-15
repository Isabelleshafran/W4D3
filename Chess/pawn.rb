require_relative 'piece'

class Pawn < Piece

    def symbol
        :♟.(@color).white 
    end

    def moves
        forward_step + side_attacks
    end

    def at_start_row?
        @pos[0] ==  (color == :white)? 1 : 6
    end

    def forward_dir
        (color == :white) ? 1 : -1
    end

    def forward_step
        #one_step 
        x,y = @pos 
        step = []
        one_step = [x + forward_dir, y]
        if board.valid_pos?(one_step) && board.empty?(one_step)
            step << one_step
        end

        #two_step if at start row
        two_step = [x + (forward_dir + 1), y]
        step << two_step if at_start_row? && board.empty?(two_step)
        step
    end

    def side_attacks
        x,y = @pos
        side_move = [[x + forward_dir, y - 1],[x + forward_dir, y + 1]]
        final_attack = []
        side_move.each do |attack|
            if !board.valid_pos?(attack) || board.empty?(attack)
                next 
            end
            potential_attack = board[attack]
            final_attack += potential_attack.select { |piece| piece.color != color }
        end
        final_attack
    end
end

