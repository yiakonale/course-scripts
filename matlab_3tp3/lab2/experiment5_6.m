clear;

[signal, Fs] = audioread('my_speech_clip.wav');

L = length(signal); % Number of samples in the signal.
T = 1/Fs;           % Sampling period in seconds.
t = [0:L-1]*T;      % Time vector in seconds.


Te = 20;        %echo delay in ms
alpha = 1.0;    %echo scale factor


sampleDelay = round(Te/(1000*T));           %timestep delay equivalent to Te
echo = [zeros(sampleDelay-1,1); alpha];     %impulse response for echo
IR = [1; echo];                             %impulse response for echo + signal

signalplusecho_conv = conv(signal, IR);                                    %produce echo through convolution
signalplusecho_conv = signalplusecho_conv/max(abs(signalplusecho_conv));   %rescale signal


audiowrite('speechwithecho_convolution.wav', signalplusecho_conv, Fs);      %export