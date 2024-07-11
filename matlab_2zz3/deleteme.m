clear;

fileID = fopen('data.txt','r');
data = fscanf(fileID,'%f %f %f %d',[4 inf]);
fclose(fileID);
data = data';

t = data(:,4);
rx = 2*data(:,1);
ry = 7*data(:,1);
rz = 9*data(:,3);

plot3(rx,ry,rz,'Linewidth',2)
xlabel('x'), ylabel('y'), zlabel('z');
title('Ioannis Papaspyridis - 400363946');
grid on;