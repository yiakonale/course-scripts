h = 0.2;
X = 4;
N = round(X/h);
ex = zeros(1,N+1);
ex(1) = -2;

for n = 1:N
  ex(n+1) = ex(n) + h;
end
yExact = 10*exp(ex.*(-3.4))-9*exp(ex.*(-3.5));

[x, y] = meshgrid(-2:0.2:2,-1:0.2:3);

a = ones(size(x));
b = exp(-3.4.*x)-3.5.*y;

ascaled = a./sqrt(a.^2+b.^2);
bscaled = b./sqrt(a.^2+b.^2);


quiver(x,y,ascaled,bscaled);
axis equal;

hold on;

xlim([-2 2]);
ylim([-1 3]);
plot(ex',yExact','-k','LineWidth',2);

title('');
xlabel('x');
ylabel('y');

hold off;
