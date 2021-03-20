function [t,x] = mmilne(f,intervalo,x0,N)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%t = linspace(intervalo(1),intervalo(2),N+1)

h = (intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1).';
x = x0';
eval = zeros(size(x,1),4);
for i =1:3
    eval(:,i) = f(t(i),x(:,i));
    
    F2 = f(t(i)+h/2,x(:,i)+eval(:,1)*h/2);
    F3 = f(t(i)+3*h/4,x(:,i)+F2*3*h/4);
    x(:,i+1) = x(:,i)+(h/9)*(2*eval(:,i)+3*F2+4*F3);
%     eval(:,i) = f(t(i),x(:,i));
%     x(:,i+1)=x(:,i)+h*eval(i);
end
for i=1:N-3
    eval(:,4) = f(t(i+3),x(:,i+3));
    x(:,i+4) = x(:,i)+(4*h/3)*(2*eval(:,4)-eval(:,3)+2*eval(:,2));
    for j=1:3
        eval(:,j)=eval(:,j+1);
    end
end
x = x';