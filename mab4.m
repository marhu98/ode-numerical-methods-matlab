function [t,x] = mab4(f,intervalo,x0,N)
%Adam-Bashford 4 pasos con R-K orden 3

h = (intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1).';
x = x0';
eval = zeros(size(x,1),4);
for i =1:3
    eval(:,i) = f(t(i),x(:,i));
    
    F2 = f(t(i)+h/2,x(:,i)+eval(:,1)*h/2);
    F3 = f(t(i)+3*h/4,x(:,i)+F2*3*h/4);
    x(:,i+1) = x(:,i)+(h/9)*(2*eval(:,i)+3*F2+4*F3);
end
for i=1:N-3
    eval(:,4) = f(t(i+3),x(:,i+3));
    x(:,i+4) = x(:,i+3)+(h/24)*(55*eval(:,4)-59*eval(:,3)+37*eval(:,2)-9*eval(:,1));
    for j=1:3
        eval(:,j)=eval(:,j+1);
    end
%     eval(:,1) = eval(:,2);
%     eval(:,2) = eval(:,3);
%     eval(:,3) = eval(:,4);
end
x = x';

