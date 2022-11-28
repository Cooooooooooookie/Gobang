function x = show_board(board)
%
    clc;
    fprintf('  ');
    [side_length, ~] = size(board);
    for i = 97:96 + side_length
        fprintf('   %s',i);
    end
    fprintf('\n   ');
    for i = 1:side_length
        fprintf('----');
    end
    fprintf('-\n')
    for i = 1:side_length
        fprintf('%02s |',num2str(side_length+1-i));
        for j=1:side_length
            if board(i,j) == 0
                fprintf('   |');
            elseif board(i,j) == 1
                fprintf(' O |');
            elseif board(i,j) == 2
                fprintf(' X |');
            end
        end
        fprintf('\n   ');        
        for i = 1:side_length
        fprintf('----')   
    end
    fprintf('-\n')
    end
end