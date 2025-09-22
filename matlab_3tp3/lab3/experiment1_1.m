clear;
%
% Do a plot of a sampled sinusoid with frequency f = 100 Hz
%
f = 100;
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
% Sample the sinusoid.
xnT = sin(2*pi*f*nplot);
%
% Make the plot
stem(nplot, xnT);
title("Ioannis Papaspyridis - 400363946 & Danial Noori Zadeh - 400367734",'FontSize',12);
%
% Uncomment/edit this next line to save the graph.
% exportgraphics(gcf, 'sampled_sine.jpg');
%