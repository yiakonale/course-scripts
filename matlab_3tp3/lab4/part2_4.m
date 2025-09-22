clear;
% Read in the signal from the audio file
[signal, Fs] = audioread("SecretMessage2023.wav");
L = length(signal);
T = 1/Fs;
t = [0:L-1]*T;
%
t_interval = 1;
n_interval = t_interval*Fs;
%msec_per_sec = 1000;
%numSamples = t_plot*Fs/msec_per_sec;
sig_length = round(L/Fs)-1;

opts = detectImportOptions('CodeBook.xlsx');
opts = setvartype(opts, {'SYMBOL'}, 'string');
table = readtable('CodeBook.xlsx', opts);

S = "";

for frame = 0:sig_length
    % Take the DFT
    symbol = signal(frame*n_interval+1:(frame+1)*n_interval);
    Y = fft(symbol)/n_interval;
    f = Fs/2*linspace(0,1,n_interval/2+1);
    mag = 2*abs(Y(1:n_interval/2+1));

    % Find local maxima
    maxIndices = islocalmax(mag,"MaxNumExtrema",4);
    maxima = f(maxIndices);
    
    f1 = table.F1 == maxima(1);
    f2 = table.F2 == maxima(2);
    f3 = table.F3 == maxima(3);
    f4 = table.F4 == maxima(4);
    F = f1+f2+f3+f4;
    F = F == max(F);
    
    S = append(S, table.SYMBOL(F));
end

disp(S);