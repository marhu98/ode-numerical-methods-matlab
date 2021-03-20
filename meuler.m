function [t,x]=meuler(f,intervalo,x0,N)

% La funci?n euler resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [a,b]
%  x(a)=x0,
% con x0 en R^n, mediante el m?todo de Euler (expl?cito)
% 
% ENTRADA:
% f=nombre de la funci?n (definida en formato an?nimo o como fichero de tipo funci?n
%   de Matlab) del problema que se quiere resolver, con dos argumentos de entrada: el
%   primero es un n?mero real y el segundo es un vector columna de tipo (n,1) o un vector
%   de fila de tipo (1,n)
%   intervalo: [a,b], donde est? planteado el sistema de ecuaciones diferenciales
% x0: vector inicial de tipo (1,n)
% N: n?mero de subintervalos
%
% SALIDA:
% t: vector de abscisas donde se va a aproximar la soluci?n de tipo (N+1,1)
% x: matriz de ordenadas de la soluci?n aproximada de tipo (N+1,n)

h=(intervalo(2)-intervalo(1))/N; 
t=linspace(intervalo(1),intervalo(2),N+1); %otra opci?n: t=intervalo(1):h:intervalo(2);
t=t(:);
x(1,:)=x0; % Introducimos en la primera fila de la matriz x el vector x0
for i=1:N
    x(i+1,:)=x(i,:)+h*f(t(i),x(i,:)).';
end