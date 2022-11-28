% even condition
function Even(board)

[side_length, ~] = size(board);
    
    for i = 1:side_length
        for j = 1:side_length-4
            % row checking
            if find(board(i,j:j+4) == 1) && find(board(i,j:j+4) == 2)
                % column checking
                if find(board(j:j+4,i) == 1) && find(board(j:j+4,i) == 2)
                % left slash checking
                    if i < side_length - 3 && find(diag(board(i:i+4,j:j+4)) == 1) && find(diag(board(i:i+4,j:j+4)) == 2)
                % right slash checking
                        if i < side_length - 3 && find(diag(fliplr(board(i:i+4,j:j+4))) == 1) && find(diag(fliplr(board(i:i+4,j:j+4))) == 2)
                            fprintf('Even!\n')
                        end
                    end
                end
            end
        end  
    end
    