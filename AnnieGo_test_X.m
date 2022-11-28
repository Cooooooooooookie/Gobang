
function [go_row, go_column] = AnnieGo_test_X(board, j)
    
    % AnnieGo is an auto gobang function.
    % Calculate the score of each position, and return the best placement.
    %
    % Please call AnnieGo(board), the input value is a nxn matrix,
    %
    %              O => 1      X => 2      Non => 0
    %
    % The function will return the placement [row, column].
    %
    %=====================================================================
    % Author: Cooooooooooookie, LarryWu510, annie__m_e
    % Mechanical Engineering Dept, Chang Gung University.
    
    %=========================% Parameter %=========================%
        weight   = 5.0;     % The power of the number of pieces +1.
        ox_ratio = j;     % Ratio = O / X.
    %===============================================================%
    
    [side_length, ~] = size(board);     % Get the board's size.
    score = zeros(side_length);         % Make the score matrix.
    
    %========================================================%
    %\\\\\\\\  Calculate the score of each position  ////////%
    %========================================================%
    for i = 1:side_length - 4
        for j = 1:side_length
            
            %\\\ Horizontal_line ///%
            o_num = length(find(board(j,i:i+4) == 1));  % How many O are on this line.
            x_num = length(find(board(j,i:i+4) == 2));  % How many X are on this line.
            if o_num == 0 || x_num == 0                 % If there are X and O on this line, the score is 0.
                % The score for each point on this line is pieces' number
                % add 1, then calculate the power of the weight.
                score(j,i:i+4) = score(j,i:i+4) + (o_num * ox_ratio + x_num * 1/ox_ratio + 1) ^ weight;
            end
            
            %\\\ Vertical_line ///%
            o_num = length(find(board(i:i+4,j) == 1));  % How many O are on this line.
            x_num = length(find(board(i:i+4,j) == 2));  % How many X are on this line.
            if o_num == 0 || x_num == 0                 % If there are X and O on this line, the score is 0.
                % The score for each point on this line is pieces' number
                % add 1, then calculate the power of the weight.
                score(i:i+4,j) = score(i:i+4,j) + (o_num * ox_ratio + x_num * 1/ox_ratio + 1) ^ weight;
            end
            
        end
        
        for j = 1:side_length - 4
            
            %\\\ Left_slash ///%
            o_num = length(find(diag(board(i:i+4,j:j+4)) == 1));    % How many O are on this line.
            x_num = length(find(diag(board(i:i+4,j:j+4)) == 2));    % How many X are on this line.
            if  o_num == 0 || x_num == 0                            % If there are X and O on this line, the score is 0.
                % The score for each point on this line is pieces' number
                % add 1, then calculate the power of the weight.
                for k = 1:5
                    score(i+k-1,j+k-1) = score(i+k-1,j+k-1) + (o_num * ox_ratio + x_num * 1/ox_ratio + 1) ^ weight;
                end
            end
            
            %\\\ Right_slash ///%
            o_num = length(find(diag(fliplr(board(j:j+4,i:i+4))) == 1));    % How many O are on this line.
            x_num = length(find(diag(fliplr(board(j:j+4,i:i+4))) == 2));    % How many X are on this line.
            if  o_num == 0 || x_num == 0                                    % If there are X and O on this line, the score is 0.
                % The score for each point on this line is pieces' number
                % add 1, then calculate the power of the weight.
                for k = 1:5
                    score(j+k-1,i-k+5) = score(j+k-1,i-k+5) + (o_num * ox_ratio + x_num * 1/ox_ratio + 1) ^ weight;
                end
            end
            
        end
    end
    
    %\\\ Already have pieces ///%
    score(find(board)) = 0;                             % Change the score to 0 which placement already has piece.
    
    max_point = find(score == max(max(score))) - 1;     % Find the best placement.
    go_row = mod(max_point(1), side_length) + 1;        % Calculate the row.
    go_column = fix(max_point(1) / side_length) + 1;    % Calculate the column.
