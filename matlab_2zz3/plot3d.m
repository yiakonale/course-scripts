%read data from a file and plot 3d graphs
clear;

fileID = fopen('data.txt');
data = fscanf(fileID,'%u%g%d',[3 4]);
fclose(fileID);

t = 0:0.1:25;
rx = data(1,1)*cos(t);
ry = data(2,1)*sin(t);
rz = data(3,1)*t;

plot3(rx,ry,rz,'Linewidth',1)
xlabel('x'), ylabel('y'), zlabel('z');
title('Elliptical Helix');

N = length(t);
dx = zeros(1,N-1);
dy = zeros(1,N-1);
dz = zeros(1,N-1);

for i=1:N-1
  dx(i) = (rx(i+1) - rx(i))/(t(i+1)-t(i));
  dy(i) = (ry(i+1) - ry(i))/(t(i+1)-t(i));
  dz(i) = (rz(i+1) - rz(i))/(t(i+1)-t(i));
end

hold on;
quiver3(rx(1:N-1),ry(1:N-1),rz(1:N-1),dx,dy,dz,0.2);
title('Elliptical Helix with Tangent Vectors');
hold off;