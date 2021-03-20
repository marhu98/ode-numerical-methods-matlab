function [t,x] = mab4am4(f,intervalo,x0,N)
%Adam-Moulton de 4 pasos 
%con A-B 4 pasos como prediccion

h = (intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1).';
x = x0';
eval = zeros(size(x,1),5);
for i =1:4
    eval(:,i) = f(t(i),x(:,i));
    %F2 = f(t(i)+h/2,x(:,i)+eval(:,1)*h/2);
    %F3 = f(t(i)+3*h/4,x(:,i)+F2*3*h/4);
    %x(:,i+1) = x(:,i)+(h/9)*(2*eval(:,i)+3*F2+4*F3);

    F2 = f(t(i)+h/2,x(:,i)+eval(:,1)*h/2);
    F3 = f(t(i)+h/2,x(:,i)+F2*h/2);
    F4 = f(t(i)+h,x(:,i)+eval(:,1)*h);
    x(:,i+1) = x(:,i)+(h/6)*(eval(:,1)+2*F2+2*F3+F4);
end
for i=1:N-3
    %Predicción
    %x(:,i+3) = x(:,i+2)+(h/12)*(23*eval(:,3)-16*eval(:,2)+5*eval(:,1));
    x(:,i+4) = x(:,i+3)+(h/24)*(55*eval(:,4)-59*eval(:,3)+37*eval(:,2)-9*eval(:,1));
    eval1 = f(t(i+4),x(:,i+4));
    %Corrección
    x(:,i+4)=x(:,i+3)+(h/720)*(251*eval1+646*eval(:,4)-264*eval(:,3)+106*eval(:,2)-19*eval(:,1));
    eval(:,5)=f(t(i+4),x(:,i+4));
    %Corregimos eval
    for j = 1:4
        eval(:,j)=eval(:,j+1);
    end
end
x = x';