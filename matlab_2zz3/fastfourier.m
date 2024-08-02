%using fft to construct frequency spectra
clear;

N = 256;
x = (0:N-1)/N;
f = sin(40*pi*x);
F = fft(f);

abs_F = abs(fftshift(F));
alpha = (0:N-1)-N/2;
plot(alpha,abs_F)
title('Frequency Spectrum')
xlabel('Frequency (Hz)')
ylabel('|F|')

semilogy(alpha,abs_F);
title('Frequency Spectrum (Semi-Log Plot)')
xlabel('Frequency (Hz)')
ylabel('log(|F|)')