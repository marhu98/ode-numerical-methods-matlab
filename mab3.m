function [t,x] = mab3(f,intervalo,x0,N)
%Adam-Bashford con Euler Mejorado

h = (intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1).';
x = x0';

eval = zeros(size(x,1),3);
for i =1:2
    eval(:,i) = f(t(i),x(:,i));
    F2 = f(t(i)+h/2,x(:,i)+eval(i,:)*h/2);
    x(:,i+1)=x(:,i)+(h/2)*eval(i)+(h/2)*F2;
%     x(:,i+1)=x(:,i)+h*eval(i)
end
% eval = f(t(1),x(:,1));
% x(:,2)=x(:,1)+h*eval;
% eval(:,2) = f(t(2),x(:,2));
% x(:,3)=x(:,2)+h*eval(:,2);
for i=1:N-2
    eval(:,3) = f(t(i+2),x(:,i+2));
    x(:,i+3) = x(:,i+2)+(h/12)*(23*eval(:,3)-16*eval(:,2)+5*eval(:,1));
    eval(:,1) = eval(:,2);
    eval(:,2) = eval(:,3);
end
size(eval)
x = x';

