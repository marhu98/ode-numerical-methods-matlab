function [out] = solexac2(ti)
%ti: Matrix (m,1)
%out: Matrix (m,2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
s = sqrt(2);
sol1 = @(t) 8/7*cos(s*t)-1/7*cos(3*t);
sol2 = @(t) -s*8/7*sin(s*t)+3/7*sin(3*t);

for i = 1:size(ti,2)
    out1(i) = sol1(ti(i));
    out2(i) = sol2(ti(i));

end
out = [out1',out2']