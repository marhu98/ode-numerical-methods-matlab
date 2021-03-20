function [t,x]=mrk4(f,intervalo,x0,N)
% La funci�n meulermod resuelve un problema de valor inicial de la forma
% x'=f(t,x) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el m�todo Rungr-Kutta de orden 4(cl�sico).
%
% ENTRADA:
% f: nombre de la funci�n (definida en formato an�nimo o como fichero de tipo funci�n de Matlab)
% del problema que se quiere resolver, con dos argumentos de entrada: el primero es un
% n�mero real y el segundo es un vector columna de tipo (n,1)
% intervalo: [t0,T], donde est� planteado el sistema de ecuaciones diferenciales
% x0: vector inicial de tipo (1,n)
% N: n�mero de subintervalos
%
% SALIDA:
% t: vector columna de abscisas donde se va a aproximar la soluci�n d
% x: matriz de ordenadas de la soluci�n aproximada de tipo (N+1,n)

h = (intervalo(2)-intervalo(1))/N;

x = x0';
t(1) = intervalo(1);

for i = 1:N
    t(i+1) = t(i)+h;
    F1 = f(t(i),x(:,i));
    F2 = f(t(i)+h/2,x(:,i)+F1*h/2);
    F3 = f(t(i)+h/2,x(:,i)+F2*h/2);
    F4 = f(t(i)+h,x(:,i)+F1*h);
    x(:,i+1) = x(:,i)+(h/6)*(F1+2*F2+2*F3+F4);
end
x = x';
end