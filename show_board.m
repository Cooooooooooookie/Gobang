function x = show_board(board)

    clc;
    fprintf('  ');
    side_length = size(board);
    for i = 97:96 + side_length(1)
        fprintf('   %s',i);
    end
    fprintf('\n   -----------------------------------------\n');
    
    for i=1:10
        fprintf('%02s |',num2str(11-i));
        for j=1:10
            if board(i,j) == 0
                fprintf('   |');
            elseif board(i,j) == 1
                fprintf(' O |');
            elseif board(i,j) == 2
                fprintf(' X |');
            end
        end
        fprintf('\n');
        fprintf('   -----------------------------------------\n')
    end
end