%X = 3;
%N = round(X/h);
N = 17;
x = zeros(1,N+1);
y = zeros(1,N+1);
x(1) = 0;
y(1) = 34;

maxerror = 100;

while (maxerror > 0.06431)
    h = 3/N;

    x = zeros(1,N+1);
    y = zeros(1,N+1);
    x(1) = 0;
    y(1) = 34;
    
    for n = 1:N
        x(n+1) = x(n) + h;
        y(n+1) = y(n) + h*((y(n)-22).*-1.3);
    end

    yExact = 12*exp(x.*(-13/10))+22;
    error = abs(y-yExact);

    Error = 0;

    for i = 1:N
        if error(i) > Error  
            Error = error(i);
        end
    end
    if Error < maxerror
        maxerror = Error;
    end

    N = N+1;
end

disp(maxerror);
disp(N-1);




%x3 = x
%y3 = y

%{
plot(x,yExact,'r',x,y,'.b',x,error,':b'); % plotting
title('Eulers Method for Example 1'); % figure's title,
legend('exact solution','numerical approximation','truncation error'); % legend
xlabel('x'); ylabel('y'); % and axis labels
%}

