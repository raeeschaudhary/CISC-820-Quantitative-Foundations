function deri2 = F3_dd(x)
%hessian of function 3
% dd/dx = [-400*x(2) + 1200*x(1)^2 + 2, -400*x(1); -400*x(1), 200]
deri2 = [-400*x(2) + 1200*x(1)^2 + 2, -400*x(1); -400*x(1), 200];
end