clc;
clear;
close all;

%% experiment 1
fs = 100;
ts = 1/fs;
tmin = 0;
tmax = 0.5;

Tvect = (tmin:ts:tmax)';            
n = (0:length(Tvect)-1)';           
ct = (tmin:1e-3:tmax)';             

A = [5 5 5 5 5 5];
F = [10 25 40 60 40 60];
phi = [0 0 0 0 pi/2 pi/2];
phiStr = ["0" "0" "0" "0" "\pi/2" "\pi/2"];

xt = A.*cos(2*pi.*F.*Tvect + phi);  
xct = A.*cos(2*pi.*F.*ct + phi);    

for i = 1:6
    caseName = "Case " + char('A'+i-1) + ": " + A(i) + "cos(2\pi" + F(i) + "t + " + phiStr(i) + ")";

    figure;

    % discrete-time signal
    subplot(2,1,1);
    stem(n, xt(:,i));
    grid on
    xlabel("n");
    ylabel("x[n]");
    title(caseName + ", sampled at fs = " + fs + " Hz");

    % continuous-time signal with the samples overlaid
    subplot(2,1,2);
    plot(ct, xct(:,i));
    hold on
    stem(Tvect, xt(:,i));
    hold off
    grid on
    xlim([tmin tmax]);
    xlabel("t (s)");
    ylabel("x(t)");
    title(caseName + ", continuous with samples overlaid");
    legend("x(t)", "x[n] at t = n/fs");
end


%% experiment 2
clear;
n = (1:30)';

%pt A
ui = zeros(size(n));
ui(16) = 1;                 % delta[n-16]

us = zeros(size(n));
us(12:end) = 1;             % u[n-12]

figure;

subplot(2,1,1);
stem(n, ui);
xlabel("n");
ylabel("\delta[n-16]");
title("Unit impulse \delta[n-16]");

subplot(2,1,2);
stem(n, us);
xlabel("n");
ylabel("u[n-12]");
title("Unit step u[n-12]");

%pt B
u1 = zeros(size(n));
u1(14:end) = 1;             % u[n-14]

u2 = zeros(size(n));
u2(15:end) = 1;             % u[n-15]

x1 = u1 - u2;

figure;

subplot(3,1,1);
stem(n, u1);
xlabel("n");
ylabel("u[n-14]");
title("u[n-14]");

subplot(3,1,2);
stem(n, u2);
xlabel("n");
ylabel("u[n-15]");
title("u[n-15]");

subplot(3,1,3);
stem(n, x1);
xlabel("n");
ylabel("x_1[n]");
title("x_1[n] = u[n-14] - u[n-15]");

%pt C
u3 = zeros(size(n));
u3(9:end) = 1;              % u[n-9]

u4 = zeros(size(n));
u4(16:end) = 1;             % u[n-16]

x2 = u3 - u4;

figure;

subplot(3,1,1);
stem(n, u3);
xlabel("n");
ylabel("u[n-9]");
title("u[n-9]");

subplot(3,1,2);
stem(n, u4);
xlabel("n");
ylabel("u[n-16]");
title("u[n-16]");

subplot(3,1,3);
stem(n, x2);
xlabel("n");
ylabel("x_2[n]");
title("x_2[n] = u[n-9] - u[n-16]");


%% experiment 3
clear;
n = (1:40)';
A = 1;
w = pi/10;

xn = A.*exp(1i*w.*n);

%pt A
figure;
plot(real(xn), imag(xn), 'o-');
axis equal
grid on
xlabel("Re(x[n])");
ylabel("Im(x[n])");
title("x[n] in the complex plane");

%pt B
rexn = real(xn);
imxn = imag(xn);

figure;

subplot(2,1,1);
stem(n, rexn);
grid on
xlabel("n");
ylabel("Re(x[n])");
title("Real part of x[n] vs n");

subplot(2,1,2);
stem(n, imxn);
grid on
xlabel("n");
ylabel("Im(x[n])");
title("Imaginary part of x[n] vs n");

%pt C
magxn = abs(xn);
phxn = unwrap(angle(xn));

figure;

subplot(2,1,1);
stem(n, magxn);
grid on
xlabel("n");
ylabel("|x[n]|");
title("Magnitude of x[n] vs n");

subplot(2,1,2);
stem(n, phxn);
grid on
xlabel("n");
ylabel("Phase (rad)");
title("Unwrapped phase of x[n] vs n");

%% experiment 4
%pt a, b, c
clear;
clc;
close all;

[y,fs] = audioread('defineit.wav');

figure;
subplot(2,1,1);
plot(y);
title('Original Speech Waveform');
xlabel('Sample n');
ylabel('Amplitude');
subplot(2,1,2);
histogram(y,50);
title('Histogram of Original Speech');
xlabel('Amplitude');
ylabel('Count');

info = audioinfo('defineit.wav')
%soundsc(y, fs);

%pt e
y_scaled = y./(max(abs(y)));

%pt d
range = [-1 1];
bits = 3;
levels = linspace(range(1),range(2),2^bits);
delta = levels(2) - levels(1);
y3bit = quantize(y_scaled, levels);

%pt f
soundsc(y3bit, fs);
figure;
subplot(2,1,1);
plot(y3bit);
title('3-bit Quantized Speech Waveform');
xlabel('Sample n');
ylabel('Amplitude');
subplot(2,1,2);
histogram(y3bit);
title('Histogram of 3-bit Quantized Speech');
xlabel('Amplitude');
ylabel('Count');
e = y_scaled - y3bit;

figure;
subplot(2,1,1);
plot(e);
title('Quantization Error');
xlabel('Sample n');
ylabel('Error Amplitude');
subplot(2,1,2);
histogram(e,50);
title('Histogram of Quantization Error');
xlabel('Error Amplitude');
ylabel('Count');

%pt g
y_pclip = 5*y_scaled;
y3bit_pclip = quantize(y_pclip, levels);

%soundsc(y3bit_pclip, fs);

figure;
subplot(2,1,1);
plot(y3bit_pclip);
title('3-bit Quantized Peak-Clipped Speech Waveform');
xlabel('Sample n');
ylabel('Amplitude');
subplot(2,1,2);
histogram(y3bit_pclip);
title('Histogram of 3-bit Quantized Peak-Clipped Speech');
xlabel('Amplitude');
ylabel('Count');
e_pclip = y_pclip - y3bit_pclip;

figure;
subplot(2,1,1);
plot(e_pclip);
title('Quantization Error (Peak-Clipped)');
xlabel('Sample n');
ylabel('Error Amplitude');
subplot(2,1,2);
histogram(e_pclip,50);
title('Histogram of Quantization Error (Peak-Clipped)');
xlabel('Error Amplitude');
ylabel('Count');

function yq = quantize(x, levels)
    delta = levels(2) - levels(1);
    yq = zeros(size(x));
    for i=1:length(x)
        yq(i) = levels(end);
        for j=1:(length(levels)-1)
            if x(i) <= (levels(j)+delta/2)
                yq(i) = levels(j);
                break;
            end
        end
    end
end