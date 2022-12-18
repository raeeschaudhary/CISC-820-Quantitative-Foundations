function deri2 = F2_dd(x)
%hessian of function 2
% dd/dx = A'diag(1./((b-Ax)^2))A   diagonal ....
%[A, B, C] = Read_Data();
global A B C;
deri2 = A'*diag(1./((B - A*x).^2))*A;
end