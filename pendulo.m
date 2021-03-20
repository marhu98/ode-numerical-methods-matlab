clear all
close all

m=1;
g = 9.8;
T = 10;
F = 0;
L = 1;
T = 10;
N = 1000;
%B = [0,0.25,1.5];
B = 0;
%x0 = [-1,-1;0,1;1,0;1,1;1,2;2,2];
x0 = [-1,-1;0,1;pi,0;pi,4];
colx = size(x0,1);

for j = 1:size(B,2)
    figure(j);
    for i = 1:colx
        f = @(t,x) [x(2);(1/(m*L))*(F-2*L*B(j)*x(2)-m*g*sin(x(1)))];
        h = @(t,x) [x(2);(1/(m*L))*(F-2*L*B(j)*x(2)-m*g*x(1))];
        %h = @(s,z) [z(2);z(1)];
        [t,x] = mrk4(f,[0 T],x0(i,:),N);
        [s,z] = mrk4(h,[0 T],x0(i,:),N);
        %y(i,:,:) = x;
        subplot(colx,1,i);
        %plot(y(i,:,1),y(i,:,2))
        plot(x(:,1),x(:,2))
        subplot(colx,2,i);
        plot(z(:,1),z(:,2))
    end
end