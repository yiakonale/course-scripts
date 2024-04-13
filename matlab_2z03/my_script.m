xi=[-2 -1 0 1 2 3]'
yi=[-8 4 8 1 5 15]'
A=[xi.^3 xi.^2 xi ones(6,1)]
b=yi

x=A\b

f = @(t) x(1)*t.^3+x(2)*t.^2+x(3)*t+x(4);
t = -2.5:.01:3.5;
y = f(t);

plot(t,y,xi,yi,'o','MarkerSize',5,'MarkerFaceColor','black')