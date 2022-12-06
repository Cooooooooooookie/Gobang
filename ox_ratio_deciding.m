function ox_ratio = ox_ratio_deciding(board)
    
    [side_length, ~] = size(board);     % Get the board's size.
    score_o = zeros(side_length);
    score_x = zeros(side_length);
    ox_ratio = 1;
    weight = 1;
    for i = 1:side_length - 4
        for j = 1:side_length           
            %\\\ Horizontal_line ///%
            o_num = length(find(board(j,i:i+4) == 1));  % How many O are on this line.
            x_num = length(find(board(j,i:i+4) == 2));  % How many X are on this line.
            if o_num == 0 || x_num == 0                 % If there are X and O on this line, the score is 0.
                % The score for each point on this line is pieces' number
                % add 1, then calculate the power of the weight.
                score_o(j,i:i+4) = score_o(j,i:i+4) + (o_num * ox_ratio + 1) ^ weight;
                score_x(j,i:i+4) = score_x(j,i:i+4) + (x_num * 1/ox_ratio + 1) ^ weight;
            end            
            %\\\ Vertical_line ///%
            o_num = length(find(board(i:i+4,j) == 1));  % How many O are on this line.
            x_num = length(find(board(i:i+4,j) == 2));  % How many X are on this line.
            if o_num == 0 || x_num == 0                 % If there are X and O on this line, the score is 0.
                % The score for each point on this line is pieces' number
                % add 1, then calculate the power of the weight.
                score_o(i:i+4,j) = score_o(i:i+4,j) + (o_num * ox_ratio + 1) ^ weight;
                score_x(i:i+4,j) = score_x(i:i+4,j) + (x_num * 1/ox_ratio + 1) ^ weight;
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
                    score_o(i+k-1,j+k-1) = score_o(i+k-1,j+k-1) + (o_num * ox_ratio + 1) ^ weight;
                    score_x(i+k-1,j+k-1) = score_x(i+k-1,j+k-1) + (x_num * 1/ox_ratio + 1) ^ weight;
                end
            end            
            %\\\ Right_slash ///%
            o_num = length(find(diag(fliplr(board(j:j+4,i:i+4))) == 1));    % How many O are on this line.
            x_num = length(find(diag(fliplr(board(j:j+4,i:i+4))) == 2));    % How many X are on this line.
            if  o_num == 0 || x_num == 0                                    % If there are X and O on this line, the score is 0.
                % The score for each point on this line is pieces' number
                % add 1, then calculate the power of the weight.
                for k = 1:5
                    score_o(j+k-1,i-k+5) = score_o(j+k-1,i-k+5) + (o_num * ox_ratio + 1) ^ weight;
                    score_x(j+k-1,i-k+5) = score_x(j+k-1,i-k+5) + (x_num * 1/ox_ratio + 1) ^ weight;
                end
            end            
        end
    end
    o_sum = sum(score_o,'all');
    x_sum = sum(score_x,'all');
    ox_ration = o_sum / x_sum;
    if ox_ratio > 1
        ox_ratio = 0.95;
    else
        ox_ratio = 1.08;
    end
end
