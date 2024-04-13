%yExact = 4*exp(1/6*x.^3);
%error = abs(y-yExact);
%plot(x,yExact,'r',x1,y1,'.b',x2,y2,'.g',x3,y3,'.c'); % plotting
plot(x,g,'r',x,y,'b');
title(''); % figure's title,
legend('surrounding temperature g(t)','temperature of bolt T(t)'); % legend
xlabel('x'); ylabel('y'); % and axis labels
