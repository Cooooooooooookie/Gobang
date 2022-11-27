clear; clc;
m = 15;
board = zeros(m);
O_win = 0; X_win = 0;
for round = 1:m^2
    show_board(board);

    [X_win, O_win] = winner(board, X_win, O_win);
    
    if O_win == 1
        fprintf('O win!\n');
        break
    elseif X_win == 1
        fprintf('X win!\n');
        break
    end

    if mod(round, 2) == 1
        x = input('O Round\n','s');
        while str2num(x(2:3)) > m || double(x(1)-96) > m || board(m + 1 -str2num(x(2:3)),double(x(1))-96) == 1 || board(m + 1 -str2num(x(2:3)),double(x(1))-96) == 2
            x = input('O Round\n','s');
        end
        board(m + 1 - str2num(x(2:3)),double(x(1))-96) = 1; 
    else
        [row, column] = AnnieGo(board);
        board(row, column) = 2;
    end
end