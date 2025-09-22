clear;

[signal, Fs] = audioread('my_speech_clip.wav');

L = length(signal); % Number of samples in the signal.
T = 1/Fs;           % Sampling period in seconds.
t = [0:L-1]*T;      % Time vector in seconds.


Te = 20;        %echo delay in ms
alpha = 0.8;    %echo scale factor
Ne = 5;         %number of echos


sampleDelay = round(Te/(1000*T));           %timestep delay equivalent to Te  
IR_conv = [1; zeros(Ne*sampleDelay-1,1)];   %impulse response signal

for i=1:Ne
    IR_conv(i*sampleDelay+1) = alpha^i;     %impulse response for up to the nth echo
end


signalplusreverb = conv(signal, IR_conv);                               %produce echo through convolution
signalplusreverb = signalplusreverb/max(abs(signalplusreverb));         %rescale signal


audiowrite('speechwithreverb_convolution.wav', signalplusreverb, Fs);   %export