clear;
% Read in the signal from the audio file
[signal, Fs] = audioread("tones2023.wav");
L = length(signal);
T = 1/Fs;
t = [0:L-1]*T;
% Plot the signal for t_plot msec
t_plot = 5;
msec_per_sec = 1000;
numSamples = t_plot*Fs/msec_per_sec;

save('part1','signal','Fs','L','T','t','t_plot','msec_per_sec','numSamples');

Y = fft(signal);

subplot(3,1,1);
plot(msec_per_sec*t(1:numSamples), signal(1:numSamples));
subtitle('Plot of Input Signal');
xlabel('time (milliseconds)');
grid('minor');

subplot(3,1,2);
stem(Fs/L*(0:L-1),abs(Y),"LineWidth",2);
title("Complex Magnitude of fft Spectrum");
xlabel("f (Hz)");
ylabel("|fft(X)|");

subplot(3,1,3);
Y = fft(signal);
stem(Fs/L*(-L/2:L/2-1),abs(fftshift(Y)),"LineWidth",2);
title("Complex Magnitude of fft Spectrum");
xlabel("f (Hz)");
ylabel("|fft(X)|");



% Take the DFT
Y = fft(signal)/L;
f = Fs/2*linspace(0,1,L/2+1);
% Plot the single-sided magnitude spectrum.
figure
plot(f,2*abs(Y(1:L/2+1)));
title('Single-Sided Magnitude Spectrum')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
axis([0 Fs/2 0 .5]);
grid('minor');