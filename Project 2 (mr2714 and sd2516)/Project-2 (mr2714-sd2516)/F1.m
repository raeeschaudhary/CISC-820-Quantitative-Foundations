function fx1 = F1(x)
%define objective function 1
%f(x) = sum (i.x)^2 where i = 1 to 100
iis = 1:1:100;
fx1 = dot(iis', (x.^2));
end