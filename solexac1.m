function [out] = solexac1(ti)
%ti: Matrix (m,1)
%out: Matrix (m,2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
sol1 = @(t) exp(-0.1*t)*sin(2*t);
sol2 = @(t) exp(-0.1*t)*cos(2*t);

for i = 1:size(ti,2)
    out1(i) = sol1(ti(i));
    out2(i) = sol2(ti(i));

end
out = [out1',out2']

