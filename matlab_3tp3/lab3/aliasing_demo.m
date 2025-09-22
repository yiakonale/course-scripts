clear;
% Use sinusoid frequency f = 7600 Hz
f = 7600;
%
% Sampling frequency and interval
fs = 8000;
Ts = 1/fs;
%
% Set time duration of plot, i.e., 10 msec.
tfinalplot = 1e-3;
%
% Make the time vector for the plot
nplot=0:Ts:tfinalplot;
nlen = length(nplot);
%
% Sample the sinusoid.
xnT = sin(2*pi*f*nplot);
%
% Make the plot
plot(nplot, xnT, '-*','LineWidth',2);
hold on
grid on
fplot(@(t) sin(2*pi*f*t), [0 tfinalplot], 'LineWidth',2);
xline(nplot, 'LineWidth',1.2);
%plot(nplot,xnT(1:nlen),'r*')
hold off
legend('sampled wave','actual wave','sample interval')
%
% Save xnT as a wav sound file, soundfile.wav.
% audiowrite(’soundfile.wav’, xnT’, fs);
%
% Uncomment/edit this next line to save the graph.
% exportgraphics(gcf, ’filename_you_want.jpg’);
%
