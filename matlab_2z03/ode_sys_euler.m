E0 = 0.5;
k1 = 0.5;
kminus1 = 0.3;
k2 = 0.1;

h = 0.1;
T = 10;
N = round(T/h);

x = zeros(1,N+1);
y = zeros(1,N+1);
x(1) = 0.8;
y(1) = 0;

H = zeros(1,N+1);
H(1) = 0;

for n = 1:N
  H(n+1) = H(n) + h;
  x(n+1) = x(n) + h*(-k1* (E0-y(n)) * x(n) + kminus1*y(n));
  y(n+1) = y(n) + h*(k1* (E0-y(n)) * x(n) -(kminus1+k2)*y(n));
end

disp([x(51),x(101)]);