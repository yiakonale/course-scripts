% clear;

xn_a = [0 0 1 1 1 0 0];
vn_a = [0 0 1 1 1 1 0 0];
conv_a = conv(xn_a,vn_a);

xn_b = [0 0 2 1 0 0 0];
vn_b = [0 0 1 1 1 1 0 0];
conv_b = conv(xn_b,vn_b);

xn_c = [0 0 2 1 0 0 0];
vn_c = [0 0 0 1 2 0 0 0];
conv_c = conv(xn_c,vn_c);

n_x = -2:4;
n_v = -2:5;
n_c = -4:9;

figure(Name=myTitle);
%a
subplot(3,3,1);
stem(n_x, xn_a)
ylim([0 3])
subtitle('x[n]')

title('a')

subplot(3,3,4);
stem(n_v, vn_a)
ylim([0 3])
subtitle('v[n]')

subplot(3,3,7);
stem(n_c, conv_a)
ylim([0 6])
subtitle('Convolution')

%b
subplot(3,3,2);
stem(n_x, xn_b)
ylim([0 3])
subtitle('x[n]')

title('b')

subplot(3,3,5);
stem(n_v, vn_b)
ylim([0 3])
subtitle('v[n]')

subplot(3,3,8);
stem(n_c, conv_b)
ylim([0 6])
subtitle('Convolution')

%c
subplot(3,3,3);
stem(n_x, xn_c)
ylim([0 3])
subtitle('x[n]')

title('c')

subplot(3,3,6);
stem(n_v, vn_c)
ylim([0 3])
subtitle('v[n]')

subplot(3,3,9);
stem(n_c, conv_c)
ylim([0 6])
subtitle('Convolution')