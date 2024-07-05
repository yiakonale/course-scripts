%approximate e^-x -pi<x<pi using the complex fourier series
clear;

c = zeros(1,41);
lower = -pi;
upper = pi;
T = upper - lower;
w = 2*pi/T;
x = linspace(lower,upper,200);
f = exp(-x);
for n = 1:41
    y = f.*exp(-1i*(n-21)*w*x);
    c(n) = (1/T)*trapz(x,y);
end

fc = zeros(1,200);
for n = 1:41
    fc = fc + c(n)*exp(1i*(n-21)*w*x);
end

fc = real(fc);
plot(x,f,'r',x,fc,'b')
legend('f','fc')
title('y=exp(-x)')