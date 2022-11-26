% winner deciding
function [X_win O_win] = winner(board, X_win, O_win)
    
    A = find(board == 2);
    B = find(board == 1);
    size_A = size(A);
    size_B = size(B);
    
    for i = 1:1:size_A
        % check right down
        if any(find(A == A(i)+11)) && any(find(A == A(i)+22)) && any(find(A == A(i)+33)) && any(find(A == A(i)+44))
            X_win = 1;
        % check left down 
        elseif any(find(A == A(i)-9)) && any(find(A == A(i)-18)) && any(find(A == A(i)-27)) && any(find(A == A(i)-36))
            X_win = 1;
        % check right
        elseif any(find(A == A(i)+10)) && any(find(A == A(i)+20)) && any(find(A == A(i)+30)) && any(find(A == A(i)+40))
            X_win = 1;
        % check down 
        elseif any(find(A == A(i)+1)) && any(find(A == A(i)+2)) && any(find(A == A(i)+3)) && any(find(A == A(i)+4)) && fix(A(i)/10) == fix((A(i)+3)/10)
            X_win = 1;
        end
    end
    for i = 1:1:size_B
        % check right down 
        if any(find(B == B(i)+11)) && any(find(B == B(i)+22)) && any(find(B == B(i)+33)) && any(find(B == B(i)+44))
            O_win = 1;
        % check left down 
        elseif any(find(B == B(i)-9)) && any(find(B == B(i)-18)) && any(find(B == B(i)-27)) && any(find(B == B(i)-36))
            O_win = 1;
        % check left
        elseif any(find(B == B(i)+10)) && any(find(B == B(i)+20)) && any(find(B == B(i)+30)) && any(find(B == B(i)+40))
            O_win = 1;
        % check down 
        elseif any(find(B == B(i)+1)) && any(find(B == B(i)+2)) && any(find(B == B(i)+3)) && any(find(B == B(i)+4)) && fix(B(i)/10) == fix((B(i)+3)/10)
            O_win = 1;
        end
    end
end