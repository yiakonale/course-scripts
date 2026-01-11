%%ee3fk4 - set 3 - lab 1
clear; clc; close all

c = 3e8;
t = linspace(0,3e-8,1e3);
i = 0.12*(sin(pi*c*t)-cos(pi*c*t));

figure;
plot(t,i)
grid on
title("Ioannis Papaspyridis - papaspyi - 400363946");
legend("i(t)")
ylabel("I (A)")
xlabel("Time (s)")