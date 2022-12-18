function deri1 = F1_d(x)
%derivative of function 1
% d/dx = (i.x)^2  = 2x, 4x, 6x, ....
iis = 2:2:200;
deri1 = iis'.*x;
end