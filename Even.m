% even condition
function Even(board)

[side_length, ~] = size(board);
    
    for i = 1:side_length
        for j = 1:side_length-4
            % row checking
            if length(find(board(i,j:j+4) == 1)) ~= 0 && length(find(board(i,j:j+4) == 2)) ~= 0
                % column checking
                if length(find(board(j:j+4,i) == 1)) ~= 0 && length(find(board(j:j+4,i) == 2)) ~= 0
                % left slash checking
                    if i < side_length - 3 && length(find(diag(board(i:i+4,j:j+4)) == 1)) ~= 0 && length(find(diag(board(i:i+4,j:j+4)) == 2)) ~= 0
                % right slash checking
                        if i < side_length - 3 && length(find(diag(fliplr(board(i:i+4,j:j+4))) == 1)) ~= 0 && length(find(diag(fliplr(board(i:i+4,j:j+4))) == 2)) ~= 0
%                             fprintf('Even!\n');
                        end
                    end
                end
            end
        end  
    end
    