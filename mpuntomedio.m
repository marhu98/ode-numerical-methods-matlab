function [t,x] = mpuntomedio(f,intervalo,x0,N)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%t = linspace(intervalo(1),intervalo(2),N+1)

h = intervalo(2)-intervalo(1);
h = h/N;
t=linspace(intervalo(1),intervalo(2),N+1).';
x = x0';
x(:,2)=x(:,1)+h*f(t(1),x(:,1));

for i=1:N-1
    x(:,i+2) = x(:,i+1)+2*h*f(t(i),x(:,i));
end

x = x';

end

