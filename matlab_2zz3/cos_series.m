%approximate x^2 0<x<L using the cosine half-range expansion
clear;

a = zeros(1,5);
upper = 3;
lower = 0;
T = upper - lower;
w = 2*pi/T;
x = linspace(lower,upper,200);
f = x.^2;

a0 = (1/T)*trapz(x,f);

for n = 1:5
    y = f.*cos(n*w*x/2);
    a(n) = (2/T)*trapz(x,y);
end

fh = zeros(1,200);

for n = 1:5
    fh = fh + a(n)*cos(n*w*x/2);
end

fh = a0 + fh;

plot(x,f,'r',x,fh,'b')
legend('f','fh','Location','best')
title('y=x^2,  0 < x < 3')