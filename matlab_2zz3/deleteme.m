clear; 

x = linspace(-3,0,200);
f = x.^2;

fh = zeros(1,200);

for n = 1:5
    fh = fh + a(n)*cos(n*pi*x/3);
end

fh = a0/2 + fh;

hold on
plot(x,f,'r',x,fh,'b')
legend('f','fh','Location','best')
title('Even extension of y = x^2,  0 < x < 3')
hold off;