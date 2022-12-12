clear; clc;

m = 19;
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
    winner = win_or_even(board, row, column);
    if winner == 1
        fprintf('O win!\n');
        break
    elseif winner == 2
        fprintf('X win!\n');
        break
    elseif winner == 3
        fprintf('Even!');
    end
    
    if mod(round, 2) == 1
        o = input('O Round\n','s');
        re = 'return';
        % regret the previous step
        while strcmp(o,re)
            board(m + 1 - str2num(x_return(2:3)),double(x_return(1))-96) = 0;
            board(row, column) = 0;
            show_board(board);
            o = input('O Round\n','s');
        end
        x(1) = str2num(o(2:3));
        x(2) = double(o(1)-96);
        while x(1) > m || x(2) > m || board(m + 1 - x(1), x(2)) ~=0
            o = input('O Round\n','s');
        end
        x(1) = str2num(o(2:3));
        x(2) = double(o(1)-96);
        x_return = x;
        board(m + 1 - x(1), x(2)) = 1;    
        row = m + 1 - x(1);
        column = x(2);
    else
        [row, column] = AnnieGo(board);
        pause(1);
        board(row, column) = 2;        
    end
    
    
    
end