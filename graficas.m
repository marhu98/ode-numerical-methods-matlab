% figure(1)
% subplot(dim,1,1)
% 
% if dim == 1
%     plot(t,x)
% elseif dim == 2
%     %legend('Primera componente')
%     plot(t,x(:,1),'r')
%     subplot(dim,1,2)
%     %legend('Segunda componente')
%     plot(t,x(:,2),'g')
%     pause(1)
%     figure(2)
%     plot(x(:,1),x(:,2))
% elseif dim == 3
%     plot(t,x(:,1),'r')
%     subplot(dim,1,2)
%     plot(t,x(:,2),'g')
%     subplot(dim,1,3)
%     plot(t,x(:,3),'b')
%     pause(1)
%     figure(2)
%     plot3(x(:,1),x(:,2),x(:,3))
% end
% 
% % subplot(2,1,1)
% % plot(t,x(:,1))
% % subplot(2,1,2)
% % plot(t,x(:,2))
% % pause(1)
% % figure(2)
% % plot(x(:,1),x(:,2))

colx=size(x,2); % Numero de columnas de la matriz x
color=['r' 'g' 'b'];
figure(1)
for i=1:colx 
  subplot(colx,1,i)
  plot(t,x(:,i),color(i))
  s=sprintf('Coordenada %d de la solucion',i);
  title(s)
end
if colx>1
  %pause(3) %No me gustan las pausas
  figure(2)
  if colx==2
      plot(x(:,1),x(:,2),'r')
      %comet(x(:,1),x(:,2))
  else
      %plot3(x(:,1),x(:,2),x(:,3),'r')
      comet3(x(:,1),x(:,2),x(:,3))
  end
title('Trayectoria de la solucion')
end
