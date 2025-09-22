clear;
load('part1');

f1 = 1000; m1 = 0.4;
f2 = 4000; m2 = 0.2;
f3 = 6000; m3 = 0.2;

S = m1*sin(2*pi*f1*t) + m2*sin(2*pi*f2*t) + m3*sin(2*pi*f3*t);

subplot(2,1,1);
plot(msec_per_sec*t(1:numSamples), signal(1:numSamples));
subtitle('Plot of Original Signal');
xlabel('time (milliseconds)');
grid('minor');

subplot(2,1,2);
plot(msec_per_sec*t(1:numSamples), S(1:numSamples));
subtitle('Plot of Reconstructed Signal');
xlabel('time (milliseconds)');
grid('minor');