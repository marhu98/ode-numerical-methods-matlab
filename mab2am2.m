function [t,x] = mab2am2(f,intervalo,x0,N)
%Adam-Moulton de 2 pasos 
%con A-B 2 pasos como prediccion

h = (intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1).';
x = x0';
eval = f(t(1),x(:,1));
F2 = f(t(2),x(:,1)+eval(:,1)*h);
x(:,2) = x(:,1)+h/2*(eval(:,1)+F2);
eval(:,2)=f(t(2),x(:,2));
for i=1:N-1
    %Predicción
    x(:,i+2) = x(:,i+1)+(h/2)*(3*eval(:,2)-eval(:,1));
    eval1 = f(t(i+2),x(:,i+2));
    %Corrección
    x(:,i+2)=x(:,i+1)+(h/12)*(5*eval1+8*eval(:,2)-eval(:,1));
    eval(:,3)=f(t(i+2),x(:,i+2));
    %Corregimos eval
    eval(:,1) = eval(:,2);
    eval(:,2)=eval(:,3);
end
x = x';

