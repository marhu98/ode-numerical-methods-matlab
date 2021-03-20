close all
clear all
close all
clear all
hold on

a = 1;
b = 1;
c = 1;
d = 1; e = 0.4; fconst = 0.02;
intervalo = [0 100];
N = 10^5;
x0 = [1,1];

f = @(t,x) [a*x(1)-b*x(1)*x(2)-e*x(1)^2;-c*x(2)+d*x(1)*x(2)-fc];
[t,x] = mrk4(f,intervalo,x0,N);
figure(1)
plot(x(:,1),x(:,2));

a = 3; b = 0.2; c = 0.6; d = 5;

f = @(t,x) [a*x(1)-b*x(1)*x(2);-c*x(2)+d*x(1)*x(2)];
[s,y] = mrk4(f,intervalo,x0,N);
figure(2)
plot(y(:,1),y(:,2));

hold off