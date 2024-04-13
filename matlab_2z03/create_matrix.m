function [A] = create_matrix(n,m)
A = ones(n,m);
for i=1:n
    for j=1:m
        A(j,i) = ((j>i)*(j+2) + A(j,i));
    end
end
end