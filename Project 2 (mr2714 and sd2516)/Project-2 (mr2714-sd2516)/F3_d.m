function deri1 = F3_d(x)
%derivative of function 3
% d/dx = [-400*(x(2) - x(1)^2)*x(1) - 2*(1-x(1)); 200*(x(2) - x(1)^2)]  
deri1 = [-400*(x(2) - x(1)^2)*x(1) - 2*(1-x(1)); 200*(x(2) - x(1)^2)];
end