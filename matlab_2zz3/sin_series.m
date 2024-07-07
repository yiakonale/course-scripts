%approximate x^2 0<x<L using the sine half-range expansion
clear;

a = zeros(1,5);
upper = 3;
lower = 0;
T = upper - lower;
w = 2*pi/T;
x = linspace(lower,upper,200);
f = x.^2;

%a0 = (1/T)*trapz(x,f);

for n = 1:10
    y = f.*sin(n*w*x/2);
    a(n) = (2/T)*trapz(x,y);
end

fh = zeros(1,200);

for n = 1:10
    fh = fh + a(n)*sin(n*w*x/2);
end

%fh = a0 + fh;

plot(x,f,'r',x,fh,'b')
legend('f','fh','Location','best')
title('y=x^2,  0 < x < 3')

x = linspace(-3,0,200);
f = -x.^2;

fh = zeros(1,200);

for n = 1:10
    fh = fh + a(n)*sin(n*w*x/2);
end

%fh = a0 + fh;

hold on
plot(x,f,'r',x,fh,'b')
legend('f','fh','Location','best')
title('Odd extension of y = x^2,  -3 < x < 3')
hold off;