clear; clc;
m = 10;
board = zeros(m);
O_win = 0; X_win = 0;
x_return = ['a', '1', '1'];
row = 1;
column = 1;
fprintf('First or Second?\n');
fs = input('Please enter F or S\n','s');
if fs == 'F'
    r = 1;
else
    r = 2;
end
    
for round = r:m^2
    
    show_board(board);
    [O_win, X_win] = win_or_even(board, row, column, m);
    if O_win == 1
        fprintf('O win!\n');
        break
    elseif X_win == 1
        fprintf('X win!\n');
        break
    end
    
    if mod(round, 2) == 1
        x = input('O Round\n','s');
        re = 'return';
        % regret the previous step
        while strcmp(x,re)
            board(m + 1 - str2num(x_return(2:3)),double(x_return(1))-96) = 0;
            board(row, column) = 0;
            show_board(board);
            x = input('O Round\n','s');
        end
        while str2num(x(2:3)) > m || double(x(1)-96) > m || board(m + 1 -str2num(x(2:3)),double(x(1))-96) == 1 || board(m + 1 -str2num(x(2:3)),double(x(1))-96) == 2
            x = input('O Round\n','s');
        end
        x_return = x;
        board(m + 1 - str2num(x(2:3)),double(x(1))-96) = 1;    
        row = m + 1 - str2num(x(2:3));
        column = double(x(1))-96;
    else
        [row, column] = AnnieGo(board);
        board(row, column) = 2;        
    end
    
    
    
end