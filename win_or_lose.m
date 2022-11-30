function win_or_lose(board, x, m)
    row = str2num(x(2:3));
    column = double(x(1)-96);
    total_line = m * (m - 4) * 2 + (m - 4)^2 * 2;
    
    % row check
    if column <= 4 
        o_num = length(find(board(row : row + 4, column) == 1));
        x_num = length(find(board(row : row + 4, column) == 2));
    elseif column >= m - 4 
        o_num = length(find(board(row - 4:row : column) == 1));
        x_num = length(find(board(row - 4:row : column) == 2));
    elseif column > 4 &&  column < m - 4
        o_num_left = length(find(board(row - 4:row : column) == 1));
        x_num_left = length(find(board(row - 4:row : column) == 2));
        o_num_right = length(find(board(row : row + 4, column) == 1));
        x_num_right = length(find(board(row : row + 4, column) == 2));
    end
    if o_num == 5 || o_num_left == 5 || o_num_right == 5
        fprintf('O win!');
    elseif x_num == 5 || x_num_left == 5 || x_num_right == 5
        fprintf('X win!');
    elseif o_num ~= 0 && x_num ~= 0
        total_line = total_line - 1;
    elseif o_num_left ~= 0 && x_num_left ~= 0
        total_line = total_line - 1;
    elseif o_num_right ~= 0 && x_num_right ~= 0
        total_line = total_line - 1;
    end
        
    % column check
    if row <= 4 
        o_num = length(find(board(row, column : column + 4) == 1));
        x_num = length(find(board(row, column : column + 4) == 2));
    elseif row >= m - 4 
        o_num = length(find(board(row, column - 4 : column) == 1));
        x_num = length(find(board(row, column - 4 : column) == 2));
    elseif row > 4 &&  row < m - 4
        o_num_up = length(find(board(row, column - 4 : column) == 1));
        x_num_up = length(find(board(row, column - 4 : column) == 2));
        o_num_down = length(find(board(row, column : column + 4) == 1));
        x_num_down = length(find(board(row, column : column + 4) == 2));
    end
    if o_num == 5 || o_num_left == 5 || o_num_right == 5
        fprintf('O win!');
    elseif x_num == 5 || x_num_left == 5 || x_num_right == 5
        fprintf('X win!');
    elseif o_num ~= 0 && x_num ~= 0
        total_line = total_line - 1;
    elseif o_num_up ~= 0 && x_num_up ~= 0
        total_line = total_line - 1;
    elseif o_num_down ~= 0 && x_num_down ~= 0
        total_line = total_line - 1;
    end
    
    % left slash check
    if row <= 4 || column<=4
        o_num = length(find(board(row : row + 4, column : column + 4) == 1));
        x_num = length(find(board(row : row + 4, column : column + 4) == 2));
    elseif row >= m - 4 || column >= m - 4
        o_num = length(find(board(row - 4 : row, column - 4 : column) == 1));
        x_num = length(find(board(row - 4 : row, column - 4 : column) == 2));
    elseif row > 4 &&  row < m - 4
        o_num_up = length(find(board(row - 4 : row, column - 4 : column) == 1));
        x_num_up = length(find(board(row - 4 : row, column - 4 : column) == 2));
        o_num_down = length(find(board(row : row + 4, column : column + 4) == 1));
        x_num_down = length(find(board(row : row + 4, column : column + 4) == 2));
    end
    if o_num == 5 || o_num_left == 5 || o_num_right == 5
        fprintf('O win!');
    elseif x_num == 5 || x_num_left == 5 || x_num_right == 5
        fprintf('X win!');
    elseif o_num ~= 0 && x_num ~= 0
        total_line = total_line - 1;
    elseif o_num_up ~= 0 && x_num_up ~= 0
        total_line = total_line - 1;
    elseif o_num_down ~= 0 && x_num_down ~= 0
        total_line = total_line - 1;
    end
    
    % right slash check
    if row <= 4 || column<=4
        o_num = length(find(fliplr(board(row : row + 4, column : column + 4)) == 1));
        x_num = length(find(fliplr(board(row : row + 4, column : column + 4)) == 2));
    elseif row >= m - 4 
        o_num = length(find(fliplr(board(row - 4 : row, column - 4 : column)) == 1));
        x_num = length(find(fliplr(board(row - 4 : row, column - 4 : column)) == 2));
    elseif row > 4 &&  row < m - 4
        o_num_up = length(find(fliplr(board(row - 4 : row, column - 4 : column)) == 1));
        x_num_up = length(find(fliplr(board(row - 4 : row, column - 4 : column)) == 2));
        o_num_down = length(find(fliplr(board(row : row + 4, column : column + 4)) == 1));
        x_num_down = length(find(fliplr(board(row : row + 4, column : column + 4)) == 2));
    end
    if o_num == 5 || o_num_left == 5 || o_num_right == 5
        fprintf('O win!');
    elseif x_num == 5 || x_num_left == 5 || x_num_right == 5
        fprintf('X win!');
    elseif o_num ~= 0 && x_num ~= 0
        total_line = total_line - 1;
    elseif o_num_up ~= 0 && x_num_up ~= 0
        total_line = total_line - 1;
    elseif o_num_down ~= 0 && x_num_down ~= 0
        total_line = total_line - 1;
    end
    
    % Even
    if total_line == 0
        fprintf('Even!');
    end
end