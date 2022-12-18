function [A,B, C] = Read_Data()
%This reads the value in function 2
% A is mxn = 500x100, B is mx1 = 500x1, C is nx1 = 100x1

file1 = fopen('fun2_A.txt','r');
global A;
A = fscanf(file1,'%e ',[500,100]);
fclose(file1);
file2 = fopen('fun2_b.txt','r');
global B;
B = fscanf(file2, '%e', [500,1]);
fclose(file2);
file3 = fopen('fun2_c.txt','r');
global C;
C = fscanf(file3, '%e', [100,1]);
fclose(file3);

end