
function [go_row, go_column] = AnnieGo(board)
    
    weight = 5;
    o_weight = 1;
    x_weight = 1.1;
    
    side_length = size(board);
    score = zeros(side_length(1));
    
    for i = 1:side_length(1) - 4
        for j = 1:side_length(1)
            %\\\ Horizontal_line ///%
            o_num = length(find(board(j,i:i+4) == 1));
            x_num = length(find(board(j,i:i+4) == 2));
            if o_num == 0 || x_num == 0
                score(j,i:i+4) = score(j,i:i+4) + (o_num * o_weight + x_num * x_weight + 1) ^ weight;
            end
            
            %\\\ Vertical_line ///%
            o_num = length(find(board(i:i+4,j) == 1));
            x_num = length(find(board(i:i+4,j) == 2));
            if o_num == 0 || x_num == 0
                score(i:i+4,j) = score(i:i+4,j) + (o_num * o_weight + x_num * x_weight + 1) ^ weight;
            end
        end
        
        for j = 1:side_length(1) - 4
            %\\\ Left_slash ///%
            o_num = length(find(diag(board(i:i+4,j:j+4)) == 1));
            x_num = length(find(diag(board(i:i+4,j:j+4)) == 2));
            if  o_num == 0 || x_num == 0
                for k = 1:5
                    score(i+k-1,j+k-1) = score(i+k-1,j+k-1) + (o_num * o_weight + x_num * x_weight + 1) ^ weight;
                end
            end
            
            %\\\ Right_slash ///%
            o_num = length(find(diag(fliplr(board(j:j+4,i:i+4))) == 1));
            x_num = length(find(diag(fliplr(board(j:j+4,i:i+4))) == 2));
            if  o_num == 0 || x_num == 0
                for k = 1:5
                    score(j+k-1,i-k+5) = score(j+k-1,i-k+5) + (o_num * o_weight + x_num * x_weight + 1) ^ weight;
                end
            end
        end
    end
    
    %\\\ Already have pieces ///%
    score(find(board)) = 0;
    
    max_point = find(score == max(max(score))) - 1;
    go_row = mod(max_point(1), side_length(1)) + 1;
    go_column = fix(max_point(1) / side_length(1)) + 1;
