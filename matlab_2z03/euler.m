%h = 0.5;
N = 136;
X = 5;
h = X/N;
%N = round(X/h);
x = zeros(1,N+1);
y = zeros(1,N+1);
g = zeros(1,N+1);
x(1) = 0;
y(1) = 34;
g(1) = 22 + 10*sin((10/((x(1)^2) + 0.5)));

for n = 1:N
  x(n+1) = x(n) + h;
  g(n+1) = 22 + 10*sin((10/((x(n)^2) + 0.5)));
  y(n+1) = y(n) + h*(-1.3*(y(n)-g(n)));
end


%x3 = x
%y3 = y

%{
yExact = exp(-x.^2);
error = abs(y-yExact);
%}