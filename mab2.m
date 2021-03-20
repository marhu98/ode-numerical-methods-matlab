function [t,x] = mab2(f,intervalo,x0,N)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%t = linspace(intervalo(1),intervalo(2),N+1)

h = (intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1).';
x = x0';
eval = f(t(1),x(:,1));
x(:,2)=x(:,1)+h*eval;
for i=1:N-1
    eval(:,2) = f(t(i+1),x(:,i+1));
    x(:,i+2) = x(:,i+1)+(h/2)*(3*eval(:,2)-eval(:,1));
    eval(:,1) = eval(:,2);
end
x = x';

