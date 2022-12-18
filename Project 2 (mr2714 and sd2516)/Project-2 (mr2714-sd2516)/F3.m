function fx3 = F3(x)
%define objective function 3
%f(x) = 100(x2 - x1^2)^2 + (1+x1)^2
fx3 = 100*(x(2) - x(1)^2)^2 + (1-x(1))^2;
end