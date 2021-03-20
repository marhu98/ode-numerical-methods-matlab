function [t,x]=mrk4(f,intervalo,x0,N)
% La función meulermod resuelve un problema de valor inicial de la forma
% x'=f(t,x) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el método Rungr-Kutta de orden 4(clásico).
%
% ENTRADA:
% f: nombre de la función (definida en formato anónimo o como fichero de tipo función de Matlab)
% del problema que se quiere resolver, con dos argumentos de entrada: el primero es un
% número real y el segundo es un vector columna de tipo (n,1)
% intervalo: [t0,T], donde está planteado el sistema de ecuaciones diferenciales
% x0: vector inicial de tipo (1,n)
% N: número de subintervalos
%
% SALIDA:
% t: vector columna de abscisas donde se va a aproximar la solución d
% x: matriz de ordenadas de la solución aproximada de tipo (N+1,n)

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