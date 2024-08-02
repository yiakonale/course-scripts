%parametric surfaces
clear;

u = linspace(0, 2*pi, 50);
v = linspace(-1,1, 50);
[u,v] = meshgrid(u,v);

x = (1+v/2.*cos(u/2)).*cos(u);
y = (1+v/2.*cos(u/2)).*sin(u);
z = v/2.*sin(u/2);

surf(x,y,z);
axis equal;
title('Mobius Strip')