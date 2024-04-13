tDomain = [0:.01:5];
x0 = [30;30];

[t x] = ode45(@spiralSink,tDomain,x0);

%distance = sqrt(sum((x(501,:)-x0').^2))


%{
plot(x(:,1),x(:,2))
title('Phase Portrait of a 2D System of ODEs');
xlabel('x');
ylabel('y');
grid on
%}

plot(t,x(:,1),'-.r', t,x(:,2),'b')
xlim([0 6]) % Gave the t axis specific limits for a clearer looking plot
title('The Solutions x and y as functions of t');
legend('x', 'y');
xlabel('t');
ylabel('x and y');
grid on