[x, y] = meshgrid(-2:0.2:2,-1:0.2:3);

a = ones(size(x));
b = sin(((x.^4)./5)+12./exp((y.^2)./10));

ascaled = a./sqrt(a.^2+b.^2);
bscaled = b./sqrt(a.^2+b.^2);


quiver(x,y,ascaled,bscaled)
axis equal;
hold on
title('');
xlabel('x');
ylabel('y');
