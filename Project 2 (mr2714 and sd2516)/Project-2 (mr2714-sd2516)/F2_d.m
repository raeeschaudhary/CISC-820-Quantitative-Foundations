function deri1 = F2_d(x)
%derivative of function 2
% d/dx = c+A'(1./(b-Ax))  
%[A, B, C] = Read_Data();
global A B C;
deri1 = C + A'*(1./(B - A*x));
end