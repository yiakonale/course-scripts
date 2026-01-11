%%ee3fk4 - set 4 - assignment 2
clear; clc; close all

b = sqrt(10^5);
x = linspace(0,0.1,1e4);

B = b*10^-7*cos(-b*x);
E = 1000*cos(-b*x);

figure;
hold on
plot3(x,zeros(size(x)),B);
plot3(x,E,zeros(size(x)));
grid on
view([25 25])
title("Ioannis Papaspyridis - papaspyi - 400363946");
legend("Bz","Ey")
ylabel("Ey(V/m)")
xlabel("x(m)")
zlabel("Bz(T)")
hold off
