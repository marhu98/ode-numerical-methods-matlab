clear all
close all


f = @(t,x) x+cos(t);
x0 = 1;
N = 100;

t = linspace(0,pi,N+1);
h = t(2)-t(1);

x = zeros(101,1);
x(1)=x0;
for i=1:N
    x(i+1)=(1+h/3)*x(i)+(h/3)*(cos(t(i))+2*cos(t(i+1)));
    x(i+1)=x(i+1)/(1-2*h/3);
end
figure(1)
plot(t,x);
figure(2);
[s,y] = mab4am4(f,[0,pi],x0,N);
plot(s,y);