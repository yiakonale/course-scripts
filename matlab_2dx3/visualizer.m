clear;
clc;

s = serialport("COM3",115200,"Timeout",60);
disp("Opening: " + s.Port);
flush(s);

status = read(s,1,'char');
while(status~='s')
    status = read(s,1,'char');
end

disp("Start data acquisition");

xyz = [];
samp = 64;
ang = 360/samp;
angles = (pi/180)*[ang:ang:360];
sines = sin(angles);
cosines = cos(angles);
z = 0;
zstep = 400; %zstep in mm

pcloud = figure;

while(1)
    status = read(s,1,'char');
    if(status=='e')
        break
    end
    for i = 1:samp
        d = readline(s);
        d = str2double(d);
        disp(d) %display measurement for debugging
        disp("next measurement")
        slice = [d*sines(i) z*zstep d*cosines(i)];
        xyz = [xyz;slice];

        scatter3(slice(1), slice(2), slice(3),'blue','.');
        hold on
        drawnow
    end
    z = z+1;
end

disp("Closing: " + s.Port)
delete(s);

for i = 0:(z-1)
     plot3(xyz((i*samp+1):((i+1)*samp),1),xyz((i*samp+1):(i+1)*samp,2),xyz((i*samp+1):(i+1)*samp,3),'black')
     plot3(xyz([(i*samp+1) (i+1)*samp],[1 1]),xyz([(i*samp+1) (i+1)*samp],[2 2]),xyz([(i*samp+1) (i+1)*samp],[3 3]),'black')
end

for i = 0:(z-2)
    for j = 1:samp
        plot3(xyz([(i*samp+j) (i+1)*samp+j],[1 1]),xyz([(i*samp+j) (i+1)*samp+j],[2 2]),xyz([(i*samp+j) (i+1)*samp+j],[3 3]),'black')
    end
end

hold off