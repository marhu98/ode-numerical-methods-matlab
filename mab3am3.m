function [t,x] = mab3am3(f,intervalo,x0,N)
%Adam-Moulton de 3 pasos 
%con A-B 3 pasos como prediccion

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
for i=1:N-2
    %Predicción
    %x(:,i+3) = x(:,i+1)+(h/2)*(3*eval(:,2)-eval(:,1));
    x(:,i+3) = x(:,i+2)+(h/12)*(23*eval(:,3)-16*eval(:,2)+5*eval(:,1));
    eval1 = f(t(i+3),x(:,i+3));
    %Corrección
    x(:,i+3)=x(:,i+2)+(h/24)*(9*eval1+19*eval(:,3)-5*eval(:,2)+eval(:,1));
    eval(:,4)=f(t(i+3),x(:,i+3));
    %Corregimos eval
    for j = 1:3
        eval(:,j)=eval(:,j+1);
    end
end
x = x';

