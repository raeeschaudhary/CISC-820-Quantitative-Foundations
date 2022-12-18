function fx2 = F2(x)
%define objective function 2
%f(x) = c'x - sum(log(b-Ax))
%[A, B, C] = Read_Data();
global A B C;
fx2 = C'*x - sum(log(B - A*x));
end