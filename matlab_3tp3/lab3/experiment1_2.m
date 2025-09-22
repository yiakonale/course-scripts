clear;
%
% Use sinusoid frequency f = 100,200,400,800 Hz
%f1 = 100; f2 = 200; f3 = 400; f4 = 800;
f1 = 7200; f2 = 7600; f3 = 7800; f4 = 7900;
%
% Sampling frequency and interval
fs = 8000;
Ts = 1/fs;
%
% Set time duration of plot, i.e., 10 msec.
tfinalplot = 10e-3;
%
% Make the time vector for the plot
nplot=0:Ts:tfinalplot;
%
% Make the time vector for replayed sound spurt
% Play the spurt for 2 seconds
tfinal = 2;
nsound=0:Ts:tfinal;
%
% Sample the sinusoid.
xnT1 = sin(2*pi*f1*nsound);
xnT2 = sin(2*pi*f2*nsound);
xnT3 = sin(2*pi*f3*nsound);
xnT4 = sin(2*pi*f4*nsound);
%
% Make the plot
subplot(2,2,1);
plot(nplot, xnT1(1:length(nplot)));
str = f1 + "Hz";
subtitle(str);

subplot(2,2,2);
plot(nplot, xnT2(1:length(nplot)));
str = f2 + "Hz";
subtitle(str);

subplot(2,2,3);
plot(nplot, xnT3(1:length(nplot)));
str = f3 + "Hz";
subtitle(str);

subplot(2,2,4);
plot(nplot, xnT4(1:length(nplot)));
str = f4 + "Hz";
subtitle(str);

sgtitle("Ioannis Papaspyridis - 400363946 & Danial Noori Zadeh - 400367734",'FontSize',12);

%
% concatenate all sampled sinusoids
xnT = [xnT1,xnT2,xnT3,xnT4];
% Save xnT as a wav sound file, soundfile.wav.
% audiowrite('soundfile2.wav', xnT, fs);
%
% Uncomment/edit this next line to save the graph.
% exportgraphics(gcf, 'sampled_sines');