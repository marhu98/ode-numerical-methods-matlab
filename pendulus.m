function [t,x] = pendulus(met1,inputArg2)
m=1;
g = 9.8;
T = 10;
F = 0;
L = 1;
B = 0;
x0 = [0,0;0,1;1,0;1,1;1,2;2,2];
f = @(t,x) [x(2);1/(m*L)*(F-2*L*B*x(2)-m*g*sin(x(1)))];
testmet(@mrk4)

t = 0;
x = 0;
end

