% winner deciding
function [X_win, O_win] = winner(board, X_win, O_win)
    for i = 1:10
        for j = 1:6
            % row
            if length(find(board(i,j:j+4) == 1)) == 5
                O_win = 1;
                % column
            elseif length(find(board(j:j+4,i) == 1)) == 5
                O_win = 1;
                % left slash
            elseif i < 7 && length(find(diag(board(i:i+4,j:j+4)) == 1)) == 5
                O_win = 1;
                % right slash
            elseif i < 7 && length(find(diag(fliplr(board(i:i+4,j:j+4))) == 1)) == 5
                O_win = 1;
                % row
            elseif length(find(board(i,j:j+4) == 2)) == 5
                X_win = 1;
                % column
            elseif length(find(board(j:j+4,i) == 2)) == 5
                X_win = 1;
                % left slash
            elseif i < 7 && length(find(diag(board(i:i+4,j:j+4)) == 2)) == 5
                X_win = 1;
                % right slash
            elseif i < 7 && length(find(diag(fliplr(board(i:i+4,j:j+4))) == 2)) == 5
                X_win = 1;
            end
        end
    end  
end