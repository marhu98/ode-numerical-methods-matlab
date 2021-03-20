datos

s = size(x0);
dim = s(2)

[t,x]=ode45(f,linspace(intervalo(1),intervalo(2),N),x0);

graficas