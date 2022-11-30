% win or even
function win_or_even(board, x, m)
    row = str2num(x(2:3));
    column = double(x(1)-96);
    total_line = m * (m - 4) * 2 + (m - 4)^2 * 2;
    
    if row - 4 <= 0
        i_left = 1;
    else
        i_left = row - 4;
    end
    if m - row < 4
        i_right = 6;
    else
        i_right = row;
    end
        
    if column - 4 <= 0
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
        o_num = length(find(board(i : i + 4, column) == 1));
        x_num = length(find(board(i : i + 4, column) == 2));
        if o_num == 5
            fprintf('O win!');
        elseif x_num == 5
            fprintf('X win!');
        elseif i == row - 2 && o_num ~= 0 && x_num ~= 0
            total_line = total_line - 1;
        end
    end
    
    % column 
    for j = j_left:j_right
        o_num = length(find(board(row, column : column + 4) == 1));
        x_num = length(find(board(row, column : column + 4) == 2));
        if o_num == 5
            fprintf('O win!');
        elseif x_num == 5
            fprintf('X win!');
        elseif j == column - 2 && o_num ~= 0 && x_num ~= 0
            total_line = total_line - 1;
        end
    end
    
    % slash component
    for i = i_left:i_right
        for j = j_left:j_right
            % left slash
            o_num = length(find(board(row : row + 4, column : column + 4) == 1));
            x_num = length(find(board(row : row + 4, column : column + 4) == 2));
            if o_num == 5
                fprintf('O win!');
            elseif x_num == 5
                fprintf('X win!');
            elseif i == row - 2 && j == column - 2 && o_num ~= 0 && x_num ~= 0
                total_line = total_line - 1;
            end
            
            % right slash
            o_num = length(find(fliplr(board(row : row + 4, column : column + 4)) == 1));
            x_num = length(find(fliplr(board(row : row + 4, column : column + 4)) == 2));
            if o_num == 5
                fprintf('O win!');
            elseif x_num == 5
                fprintf('X win!');
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
