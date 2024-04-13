function [A] = create_matrix2(a,n,m)
A = zeros(n,m);
    for i=1:n
        for j=1:m
            A(i,j)= a(i,j);
        end
    end
end