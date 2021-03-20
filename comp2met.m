function comp2met(met1,met2)
%Compara dos metodos y los imprime en colores diferentes yupiyuu
close all
datos

color=['r' 'g' 'b'];
figure(1)
[t,x] = met1(f,intervalo,x0,N);
[t,y] = met2(f,intervalo,x0,N);
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

%legend("hola")
% if colx>1
%   %pause(3) %No me gustan las pausas
%   figure(2)
%   if colx==2
%       plot(t,x(:,i),'r')
%       plot(t,y(:,i),'r')
%       %comet(x(:,1),x(:,2))
%   else
%       plot3(x(:,1),x(:,2),x(:,3),'r')
%       %comet3(x(:,1),x(:,2),x(:,3))
%       plot3(y(:,1),y(:,2),y(:,3))
%   end
% title('Trayectoria de la solucion')
% end

end

