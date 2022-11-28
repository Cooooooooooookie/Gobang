step = 0.01;
for i = 0.9:step:1.1
    for j = 0.9:step:1.1        
        m = 19;
        board = zeros(m);
        O_win = 0; X_win = 0;
        x_return = ['a', '1', '1'];
        row = 1;
        column = 1;
        for round = 1:m^2

%             show_board(board);

            [X_win, O_win] = winner(board, X_win, O_win);   
            if O_win == 1
%                 fprintf('O win!\n');
                result(i/step-89, j/step-89) = 1;
                break
            elseif X_win == 1
%                 fprintf('X win!\n');
                result(i/step-89, j/step-89) = 2;
                break
            else 
                result(i/step-89, j/step-89) = 0;
            end

            if mod(round, 2) == 1
                [row, column] = AnnieGo_test_O(board, i);
                board(row, column) = 1;
            else
                [row, column] = AnnieGo_test_X(board, j);
                board(row, column) = 2;
            end
            Even(board);
        end
    end
end