%f=@(t,x) [x(2);-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0=[0,4]; N=1000;
%k=1; m=1; f=@(t,x) [x(2);-(k/m)*x(1)]; intervalo=[0,10]; x0=[1,0]; N=1000;
%f=@(t,x) [x(2);(1-x(1)^2)*x(2)-x(1)]; intervalo = [0,10]; x0=[0.1,0.2]; N=1000;
%f=@(t,x) [x]; intervalo = [0,10]; x0=[1]; N=1000;
%f=@(t,x) [x(1);-x(3);x(2)]; intervalo = [0,10]; x0=[1,1,1]; N=1000;
f = @(t,x) [x(1)]; intervalo = [0,10]; x0 = [1];N = 100;
% %Conocidos con solucion exacta
%f=@(t,x) [-0.1*x(1)+2*x(2);-2*x(1)-0-1*x(2)]; intervalo=[0,10]; x0=[0,1]; N=1000;
%f=@(t,x) [x(2);cos(3*t)-2*x(1)]; intervalo=[0,2*pi]; x0=[0,4]; N=10^5;
%x0 = [0,10];B = 0; m=1;g = 9.8;T = 10;intervalo = [0 T];F = 0;L = 1;T = 10;N = 1000;f = @(t,x) [x(2);(1/(m*L))*(F-2*L*B*x(2)-m*g*sin(x(1)))];