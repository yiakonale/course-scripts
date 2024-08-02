%plotting fancy surfaces
clear;

x = linspace(-2, 2, 50);
y = x;
[x,y] = meshgrid(x,y);
z = x.^2+y.^2;

surf(x,y,z,x);
xlabel('x');
ylabel('y');
zlabel('z');
title('Paraboloid')

clear;

x = linspace(-2, 2, 10);
y = x;
[x,y] = meshgrid(x,y);

z = x.^2+y.^2;
Nx = 2*x./sqrt(4*z+1);
Ny = 2*y./sqrt(4*z+1);
Nz = -1./sqrt(4*z+1);

hold on;
quiver3(x,y,z,Nx,Ny,Nz,0.5,'color','k');
xlim([-2,2]);
ylim([-2,2]);
zlim([0,8]);
title('Paraboloid with Unit Normal Vectors')
hold off

clear;

u = linspace(pi/2,3*pi/2,20); v = linspace(0,pi,20);
[u,v] = meshgrid(u,v);

surf(sin(u).*cos(v),sin(u).*sin(v),cos(u),sin(u).*sin(v));
title('Hemisphere');
xlabel('x'); ylabel('y'); zlabel('z');

hold on;
surf(sin(u).*cos(v),sin(u).*sin(v),0*u,sin(u).*sin(v));
hold off;
title('Closed Hemisphere');

u = linspace(pi/2,3*pi/2,10); v = linspace(0,pi,10);
[u,v] = meshgrid(u,v);

hold on;
quiver3(sin(u).*cos(v),sin(u).*sin(v),0*u,0*u,0*u,1+0*u);
quiver3(sin(u).*cos(v),sin(u).*sin(v),cos(u),sin(u).^2.*cos(v),...
sin(u).^2.*sin(v),cos(u).*sin(u),1);

xlim([-1,1]);
ylim([-1,1]);
zlim([-1,0.4]);
title('Closed Hemisphere with Normal Vectors');
hold off;