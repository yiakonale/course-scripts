%approximate e^-x -pi<x<pi using the fourier series
clear;

a = zeros(1,20);
b = zeros(1,20);
lower = -pi;
upper = pi;
T = upper - lower;
w = 2*pi/T;
x = linspace(lower,upper,200);
f = exp(-x);

a0 = (1/T)*trapz(x,f);

for n = 1:20
    y = f.*cos(n*w*x);
    a(n) = (2/T)*trapz(x,y);

    y = f.*sin(n*w*x);
    b(n) = (2/T)*trapz(x,y);
end

fs = zeros(1,200);

for n = 1:20
    fs = fs + a(n)*cos(n*w*x) + b(n)*sin(n*w*x);
end

fs = a0 + fs;

plot(x,f,'r',x,fs,'b')
legend('f','fs')
title('y=exp(-x)')