%single, double, triple integrals, verifying green's thm and divergence thm
clear;

f = @(t) sin(t).^3.*cos(t);

quad(f,0,pi/2)
integral(f,0,pi/2)

f = @(x,y) exp(x+3*y).*(x>=y).*(x<=5-y);
dblquad(f,1,4,1,2)

fun = @(x,y) exp(y+3*x);
c = @(x) x;
d = @(x) 5-x;
integral2(fun,1,2,c,d)

clear;

line_integrand = @(t) (cos(t).^2.*sin(t).^5).*(-sin(t))+(cos(t).^3.*sin(t).^2).*cos(t);
lhs = quad(line_integrand,0,2*pi)

double_integrand = @(x,y) (3*x.^2.*y.^2-5*x.^2.*y.^4).*((x.^2+y.^2)<=1);
rhs = dblquad(double_integrand,-1,1,-1,1)

rhs = dblquad(double_integrand,-1,1,-1,1,1.0e-10)
a = -1;
b = 1;
c = @(x) -sqrt(1-x.^2);
d = @(x) sqrt(1-x.^2);
fun = @(x,y) (3*x.^2.*y.^2-5*x.^2.*y.^4); % no need for indicator functions here
integral2(fun,a,b,c,d)

clear;

a = 0;
b = 2;
c = 0;
d = sqrt(2);
v = 0;
w = exp(2^2);

fun = @(x,y,z) x.*(x>=sqrt(y)).*(z<=exp(x.^2));
triplequad(fun,a,b,c,d,v,w)


fun = @(x,y,z) y;
a = 0;
b = sqrt(2);
c = @(x) sqrt(x);
d = 2;
u = 0;
v = @(x,y) exp(y.^2);
integral3(fun,a,b,c,d,u,v)

clear; 

divF = @(x,y,z) 4*x.^3.*exp(y)-exp(x).*sin(y)+y.^2;
triplequad(divF,0,1,0,2,-1,1)

s = zeros(6,1);

f1 = @(x,y) -1*(sin(x)+y^2*(-1));
s(1) = dblquad(f1,0,1,0,2);

f2 = @(x,y) sin(x)+y^2; s(2) = dblquad(f2,0,1,0,2); % plane z = 1
f3 = @(x,z) -1*(exp(x)*cos(0)); s(3) = dblquad(f3,0,1,-1,1); % plane y = 0
f4 = @(x,z) exp(x)*cos(2); s(4) = dblquad(f4,0,1,-1,1); % plane y = 2
f5 = @(y,z) -1*(0*exp(y)); s(5) = dblquad(f5,0,2,-1,1); % plane x = 0
f6 = @(y,z) exp(y); s(6) = dblquad(f6,0,2,-1,1); % plane x = 1

sum(s)