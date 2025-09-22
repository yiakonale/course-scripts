clear;

[signal, Fs] = audioread('my_speech_clip.wav');

L = length(signal); % Number of samples in the signal.
T = 1/Fs;           % Sampling period in seconds.
t = [0:L-1]*T;      % Time vector in seconds.


Te = 50;        %echo delay in ms
alpha = 1.0;    %echo scale factor


sampleDelay = zeros(round(Te/(1000*T)),1);   %timestep delay vector equivalent to Te
echo = alpha*[sampleDelay; signal];          %create echo
signal = [signal; sampleDelay];              %extend signal to accomodate echo
signalplusecho = signal + echo;              %add echo to original signal

signalplusecho = signalplusecho/max(abs(signalplusecho));   %rescale signal

audiowrite('speechwithecho.wav', signalplusecho, Fs);       %export