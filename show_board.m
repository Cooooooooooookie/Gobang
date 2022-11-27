function x = show_board(board)

    clc;
    fprintf('  ');
    side_length = size(board);
    for i = 97:96 + side_length(1)
        fprintf('   %s',i);
    end
    fprintf('\n   ');
    for i = 1:side_length(1)
        fprintf('----');
    end
    fprintf('-\n')
    for i = 1:side_length(1)
        fprintf('%02s |',num2str(side_length(1)+1-i));
        for j=1:side_length(1)
            if board(i,j) == 0
                fprintf('   |');
            elseif board(i,j) == 1
                fprintf(' O |');
            elseif board(i,j) == 2
                fprintf(' X |');
            end
        end
        fprintf('\n   ');        
        for i = 1:side_length(1)
        fprintf('----')   
    end
    fprintf('-\n')
    end
end