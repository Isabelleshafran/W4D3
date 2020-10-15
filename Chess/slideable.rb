module Slideable
    HORIZONTAL_DIRS = [[-1, 0],[1, 0],[0, -1],[0, 1]]
    DIAGONAL_DIRS = [[-1, -1],[1, 1],[1, -1],[-1, 1]]

    def horitzontal_dirs
        HORIZONTAL_DIRS
    end

    def digaonal_dirs
        DIAGONAL_DIRS
    end
 
    def moves # if we use self each piece will know what posisiton iteratre thru direction and then see how far u can go within each direction 
        possible_moves = []
        move_dirs.each do |dir|
            flag = true
            while flag
                cur_x, cur_y = pos
            
                x,y = dir #[-1, 0]
                new_pos = [cur_x + x , cur_y + y]
                break until !board.valid_pos?(new_pos) #inside the board
                if board.empty?(new_pos)
                    possible_moves << new_pos 
                else 
                    moves << new_pos if board[new_pos].color != color
                    break
                end
            end
        end
        possible_moves
    end
        
    def move_dirs 
        raise 'Need to call on individual piece'
    end

end