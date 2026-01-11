%%ee3fk4 - set 5 - assignment 3
clear; clc; close all

% - time vector
t = linspace(0,2e-7,1000);

% - source parameters
vs = 60;
f = 25e6;
%f = linspace(0,100e6,1000);

% - line parameters
vp = 2e8;
l = 2;
zs = 100;
z0 = 50;
zl = 200;

%% Plot directly
%{
V = (80/3)*cos(2*pi*f*t-pi/2);
plot(t,V);
grid on
%}

%% Solve and plot
w = 2*pi*f;
b = w/vp;
el = b*l;

zin = z0*(zl*cos(el)+1j*z0*sin(el))./(z0*cos(el)+1j*zl*sin(el));
GL = (zl-z0)/(zl+z0);

vin = vs*zin./(zin+zs);
v0p = vin./(exp(1j*el)+GL*exp(-1j*el));
vl_ph = v0p*(1+GL);

%% Transient
%
vl_t = abs(vl_ph).*cos(w*t+angle(vl_ph));
figure
plot(t,vl_t)
xlabel('t(s)')
ylabel('V_L(V)')
ylim([-40 40])
title('V_L vs time')
%}

%% Frequency
%{
figure
plot(f,abs(vl_ph));
xlabel('f(Hz)')
ylabel('|V_L|')
ylim([0 60])
xticks([0:1:10]*10^7)
title('|V_L| vs frequency')
%}
subtitle("Ioannis Papaspyridis - papaspyi - 400363946");
grid on