function comp2ode45(met1)
%Compara dos metodos y los imprime en colores diferentes yupiyuu
close all
datos

color=['r' 'g' 'b'];
figure(1)
[t,x] = met1(f,intervalo,x0,N);
[t,y] = ode45(f,linspace(intervalo(1),intervalo(2),N+1),x0);
colx=size(x,2); % Numero de columnas de la matriz x
for i=1:colx 
  subplot(colx,1,i)
  plot(t,x(:,i),color(i))
  s=sprintf('Coordenada %d de la solucion',i);
  title(s)
end
figure(2)
for i=1:colx 
  subplot(colx,1,i)
  diff = abs(x(:,i)-y(:,i));
  plot(t,diff,color(i))
  s=sprintf('Coordenada %d de la diferencia de  de la solucion',i);
  title(s)
  legend(num2str(max(diff)))
end

end

