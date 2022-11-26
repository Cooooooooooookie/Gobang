clear; clc;
board = zeros(10);
O_win = 0; X_win = 0;
for round = 1:100
    show_board(board);
%     O = find(board == 1);
%     X = find(board == 2);

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
        while str2num(x(2:3)) > 10 || double(x(1)-96) > 10 || board(11-str2num(x(2:3)),double(x(1))-96) == 1 || board(11-str2num(x(2:3)),double(x(1))-96) == 2
            x = input('O Round\n','s');
        end
        board(11-str2num(x(2:3)),double(x(1))-96) = 1; 
    else
        x = input('X Round\n','s');
        while str2num(x(2:3)) > 10 || double(x(1)-96) > 10 || board(11-str2num(x(2:3)),double(x(1))-96) == 1 || board(11-str2num(x(2:3)),double(x(1))-96) == 2
            x = input('X Round\n','s');
        end
        board(11-str2num(x(2:3)),double(x(1))-96) = 2;
    end    
end