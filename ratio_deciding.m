function ox_ratio = ratio_deciding(board, weight)
    
    [side_length, ~] = size(board);     % Get the board's size.
    score_o = 0;
    score_x = 0;
    for i = 1:side_length - 4
        for j = 1:side_length           
            %\\\ Horizontal_line ///%
            o_num = length(find(board(j,i:i+4) == 1));  % How many O are on this line.
            x_num = length(find(board(j,i:i+4) == 2));  % How many X are on this line.
            if o_num == 0 || x_num == 0                 % If there are X and O on this line, the score is 0.
                % The score for each point on this line is pieces' number
                % add 1, then calculate the power of the weight.
                score_o = score_o + (o_num + 1) ^ weight;
                score_x = score_x + (x_num + 1) ^ weight;
            end            
            %\\\ Vertical_line ///%
            o_num = length(find(board(i:i+4,j) == 1));  % How many O are on this line.
            x_num = length(find(board(i:i+4,j) == 2));  % How many X are on this line.
            if o_num == 0 || x_num == 0                 % If there are X and O on this line, the score is 0.
                % The score for each point on this line is pieces' number
                % add 1, then calculate the power of the weight.
                score_o = score_o + (o_num + 1) ^ weight;
                score_x = score_x + (x_num + 1) ^ weight;
            end           
        end        
        for j = 1:side_length - 4            
            %\\\ Left_slash ///%
            o_num = length(find(diag(board(i:i+4,j:j+4)) == 1));    % How many O are on this line.
            x_num = length(find(diag(board(i:i+4,j:j+4)) == 2));    % How many X are on this line.
            if  o_num == 0 || x_num == 0                            % If there are X and O on this line, the score is 0.
                % The score for each point on this line is pieces' number
                % add 1, then calculate the power of the weight.
                score_o = score_o + (o_num + 1) ^ weight;
                score_x = score_x + (x_num + 1) ^ weight;
            end            
            %\\\ Right_slash ///%
            o_num = length(find(diag(fliplr(board(j:j+4,i:i+4))) == 1));    % How many O are on this line.
            x_num = length(find(diag(fliplr(board(j:j+4,i:i+4))) == 2));    % How many X are on this line.
            if  o_num == 0 || x_num == 0                                    % If there are X and O on this line, the score is 0.
                % The score for each point on this line is pieces' number
                % add 1, then calculate the power of the weight.
                score_o = score_o + (o_num + 1) ^ weight;
                score_x = score_x + (x_num + 1) ^ weight;
            end            
        end
    end
    
    if score_o < score_x
        ox_ratio = 0.95;
    else
        ox_ratio = 1.08;
    end
end
