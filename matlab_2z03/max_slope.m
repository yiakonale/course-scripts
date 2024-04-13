[x, y] = meshgrid(-3:0.1:3,-3:0.1:3);

a = ones(size(x));
b = (x-4*y)./(x.^2+y.^2+3*x-3*y+40);

max = (x(1,1)-4*y(1,1))./(x(1,1).^2+y(1,1).^2+3*x(1,1)-3*y(1,1)+40);
maxcoor = [0,0];

for i = 1:size(x)
  for j = 1:size(y)
      if b(i,j) > max
          max = b(i,j);
          maxcoor = [i,j];
      end
  end
end

max
x(maxcoor(1,1),maxcoor(1,2))
y(maxcoor(1,1),maxcoor(1,2))