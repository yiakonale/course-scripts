%contour plots, vector fields and ODEs
clear;

[x,y] = meshgrid(-10:0.5:10, -10:0.5:10);
f = @(x,y)-x.^2+y.^2;
contourf(x,y,f(x,y),10);
colorbar

[x,y] = meshgrid(-10:10, -10:10);
SDX = @(x,y) 2*x;
SDY = @(x,y) -2*y;
hold on;
quiver(x,y,SDX(x,y),SDY(x,y),'k')
hold off;

x0 = [9;-7];
rprime = @(t,x)[x(2)/(sqrt(x(1)^2+x(2)^2));x(1)/(sqrt(x(1)^2+x(2)^2))];
tDomain = 0:1/10:15;
[t r] = ode45(rprime,tDomain,x0);
[t(1:5) r(1:5,:)];
iso = r(:,2).^2 - r(:,1).^2;
iso(1:5);
hold on;
plot(r(:,1),r(:,2),'w','LineWidth',2)
hold off;