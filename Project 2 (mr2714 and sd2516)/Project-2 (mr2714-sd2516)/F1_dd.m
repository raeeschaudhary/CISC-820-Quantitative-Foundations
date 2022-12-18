function deri2 = F1_dd(x)
%hessian of function 1
% dd/dx = (i.x)^2  = 2, 4, 6, diagonal ....
i = 2:2:200;
deri2 = diag(i');
end