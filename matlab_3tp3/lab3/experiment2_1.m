clear;
% initialize chirp parameters
f1 = 100;
mu = 2000;
%
% Sampling frequency and interval
fs = 32000;
%fs = 16000;
%fs = 8000;
Ts = 1/fs;
%
% Plot the first 2000 samples
nfinalplot = 2000;
%
% Make the time vector for replayed sound chirp
% Play the chirp for 8 seconds
tfinal = 8;
nsound=0:Ts:tfinal;
%
% Sample the sinusoid.
cnT = cos((pi*mu*(nsound.^2))+(2*pi*f1*nsound));
%
% Make the plot
plot(nsound(1:nfinalplot), cnT(1:nfinalplot), 'LineWidth',1);
%
% Save xnT as a wav sound file, soundfile.wav.
% audiowrite('soundfile.wav', cnT, fs);
%
% Uncomment/edit this next line to save the graph.
% exportgraphics(gcf, 'filename_you_want.jpg');
