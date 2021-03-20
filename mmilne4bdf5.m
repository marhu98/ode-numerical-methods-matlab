function [t,x] = mmilne4bdf5(f,intervalo,x0,N)
%BDF
%con Milne 4 pasos como prediccion

h = (intervalo(2)-intervalo(1))/N;
t=linspace(intervalo(1),intervalo(2),N+1).';
x = x0';
eval = zeros(size(x,1),6);
for i =1:5
    eval(:,i) = f(t(i),x(:,i));

    F2 = f(t(i)+h/2,x(:,i)+eval(:,1)*h/2);
    F3 = f(t(i)+h/2,x(:,i)+F2*h/2);
    F4 = f(t(i)+h,x(:,i)+eval(:,1)*h);
    x(:,i+1) = x(:,i)+(h/6)*(eval(:,1)+2*F2+2*F3+F4);
end
for i=1:N-4
    %Predicción
    x(:,i+5) = x(:,i+1)+(4*h/3)*(2*eval(:,5)-eval(:,4)+2*eval(:,3));

    eval1 = f(t(i+5),x(:,i+5));
    %Corrección
    x(:,i+5) = 300*x(:,i+4)-300*x(:,i+3)+200*x(:,i+2)-75*x(:,i+1)+12*x(:,i)+60*h*eval1;
    x(:,i+5)=(1/137)*(x(:,i+5));
    eval(:,6)=f(t(i+5),x(:,i+5));
    %Corregimos eval
    for j = 1:5
        eval(:,j)=eval(:,j+1);
    end
end
x = x';