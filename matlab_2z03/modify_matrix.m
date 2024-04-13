function [A] = modify_matrix(a,n,m)
A = zeros(n,m);
    for i=1:n
        for j=1:m
            A(i,j) = (a(i,j)>=0)*(4*a(i,j)) + (a(i,j)<0)*(3+a(i,j));
        end
    end
end