function [t,x] = mab5(f,intervalo,x0,N)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%t = linspace(intervalo(1),intervalo(2),N+1)

h = (intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1).';
x = x0';
eval = zeros(size(x,1),5);
for i =1:4
    eval(:,i) = f(t(i),x(:,i));
    
    F2 = f(t(i)+h/2,x(:,i)+eval(:,1)*h/2);
    F3 = f(t(i)+h/2,x(:,i)+F2*h/2);
    F4 = f(t(i)+h,x(:,i)+eval(:,1)*h);
    x(:,i+1) = x(:,i)+(h/6)*(eval(:,1)+2*F2+2*F3+F4);
%     eval(:,i) = f(t(i),x(:,i));
%     x(:,i+1)=x(:,i)+h*eval(i);
end
for i=1:N-4
    eval(:,5) = f(t(i+4),x(:,i+4));
    x(:,i+5) = x(:,i+4)+(h/720)*(1901*eval(:,5)-2774*eval(:,4)+2616*eval(:,3)-1274*eval(:,2)+251*eval(:,1));
    for j=1:4
        eval(:,j)=eval(:,j+1);
    end
end
x = x';
