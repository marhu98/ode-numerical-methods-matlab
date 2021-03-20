clear all
close all

mu = 50;

f = @(t,x) [-mu*(x(1)-cos(t))];
solexac = @(t) (mu^2/(1+mu^2))*(cos(t)-exp(-mu*t)+(1/mu)*sin(t))

N=24;
intervalo = [0,1]

[t,x] = meuler(f,intervalo,0,N);

N = 26;

[s,y] = meuler(f,intervalo,0,N);
hold on

plot(t,x)
plot(s,y)
plot(s,solexac(s))
%plot(t,solexac)
hold off
