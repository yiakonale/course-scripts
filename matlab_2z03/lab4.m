%{
E0 = 0.1;
k1 = 0.5;
kminus1 = 0.3;
k2 = 0.6;

h = 0.1;
T = 10;
N = round(T/h);

x = zeros(1,N+1);
y = zeros(1,N+1);
x(1) = 0.5;
y(1) = 0;

H = zeros(1,N+1);
H(1) = 0;

for n = 1:N
  H(n+1) = H(n) + h;
  x(n+1) = x(n) + h*(-k1* (E0-y(n)) * x(n) + kminus1*y(n));
  y(n+1) = y(n) + h*(k1* (E0-y(n)) * x(n) -(kminus1+k2)*y(n));
end

disp([x(51),x(101)]);
%}
%{

el = 2;
ohm = 10;

h = 0.02;
T = 5;
N = round(T/h);

x = zeros(1,N+1);
u = zeros(1,N+1);
x(1) = 8;
u(1) = 4;

H = zeros(1,N+1);
H(1) = 0;

for n = 1:N
  H(n+1) = H(n) + h;
  x(n+1) = x(n) + h*u(n);
  u(n+1) = u(n) + h*(-2*el*u(n)-ohm^2*x(n));
end

plot(H,x,'r', H,u,'b')
%xlim([0 3]) % Gave the t axis specific limits for a clearer looking plot
title('');
legend('x', 'u');
xlabel('t');
ylabel('x and u');
grid on

%}
%{

el = 3;
ohm = 7;

h = 0.02;
T = 5;
N = round(T/h);

x = zeros(1,N+1);
u = zeros(1,N+1);
x(1) = 11;
u(1) = 6;

H = zeros(1,N+1);
H(1) = 0;

while 1
    for n = 1:N
        H(n+1) = H(n) + h;
        x(n+1) = x(n) + h*u(n);
        u(n+1) = u(n) + h*(-2*el*u(n)-ohm^2*x(n));
    end
        
    if min(x) >= 0
        disp(el);
        break;
    end

    el = el + 0.02;

end
%}


h = 0.01;
T = 5;
N = round(T/h);

el = 1.6; ohm = 5.6; ohms = ohm^2;

x = zeros(1,N+1); th = zeros(1,N+1);
xa = zeros(1,N+1); tha = zeros(1,N+1);
H = zeros(1,N+1);

x(1) = deg2rad(70); th(1) = 0;
xa(1) = deg2rad(70); tha(1) = 0;
H(1) = 0;

dif = zeros(1,N+1);

for n = 1:N
  x(n+1) = x(n) + h*th(n);
  th(n+1) = th(n) + h*(-2*el*th(n) - ohms*x(n));
  xa(n+1) = xa(n) + h*tha(n);
  tha(n+1) = tha(n) + h*(-2*el*tha(n) - ohms*sin(xa(n)));
  H(n+1) = H(n) + h;

  dif(n) = abs(x(n)-xa(n));
end

disp(max(dif));

plot(H,x,'r', H,xa,'-.b')
%xlim([0 3])
title('');
legend('θ', 'θα');
xlabel('t');
ylabel('θ and θα');
grid on

%}
