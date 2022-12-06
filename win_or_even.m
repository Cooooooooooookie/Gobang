% win or even
function [O_win, X_win] = win_or_even(board, row, column, m)
    O_win = 0; X_win = 0;
    total_line = m * (m - 4) * 2 + (m - 4)^2 * 2;
    % row boundary decide
    if column - 4 <= 0
        i_left = 1;
    else
        i_left = column - 4;
    end
    if m - column < 4
        i_right = 6;
    else
        i_right = column;
    end
    % column boundary decide    
    if row - 4 <= 0
        j_left = 1;
    else
        j_left = row - 4;
    end
    if m - row < 4
        j_right = 6;
    else
        j_right = row;
    end    
    % row check
    for i = i_left:i_right
        o_num = length(find(board(row, i : i + 4) == 1));
        x_num = length(find(board(row, i : i + 4) == 2));
        if o_num == 5
            O_win = 1;
            break
        elseif x_num == 5
            X_win = 1;
            break
        elseif i == row - 2 && o_num ~= 0 && x_num ~= 0
            total_line = total_line - 1;
        end
    end    
    % column 
    for j = j_left:j_right
        o_num = length(find(board(j : j + 4, column) == 1));
        x_num = length(find(board(j : j + 4, column) == 2));
        if o_num == 5
            O_win = 1;
            break
        elseif x_num == 5
            X_win = 1;
            break
        elseif j == column - 2 && o_num ~= 0 && x_num ~= 0
            total_line = total_line - 1;
        end
    end    
    % slash component
    for i = i_left:i_right
        for j = j_left:j_right
            % left slash
            o_num = length(find(diag(board(j : j + 4, i : i + 4)) == 1));
            x_num = length(find(diag(board(j : j + 4, i : i + 4)) == 2));
            if o_num == 5
                O_win = 1;
                break
            elseif x_num == 5
                X_win = 1;
                break
            elseif i == row - 2 && j == column - 2 && o_num ~= 0 && x_num ~= 0
                total_line = total_line - 1;
            end           
            % right slash
            o_num = length(find(fliplr(diag(board(j : j + 4,i : i + 4))) == 1));
            x_num = length(find(fliplr(diag(board(j : j + 4, i : i + 4))) == 2));
            if o_num == 5
                O_win = 1;
                break
            elseif x_num == 5
                X_win = 1;
                break
            elseif i == row - 2 && j == column - 2 && o_num ~= 0 && x_num ~= 0
                total_line = total_line - 1;
            end            
        end
    end  
    % even
    if total_line == 0
        fprintf('Even!');
    end
end
