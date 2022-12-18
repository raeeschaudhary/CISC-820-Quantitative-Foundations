function Run_All()
%Set alpha and tolerance
alpha = 1;
tol = 0.000001;
%Set parameters for line search
a = 0.2; %range (0, 0.5)
beta = 0.5; %range (0,1)

%Set x1 and Run all methods % x1 = [-49:1:50]';
 x1 = randi([1 10],1,100)';
 [x, minima, counter] = UC_Grad_Desc(@F1, @F1_d, x1, alpha, tol, a, beta, false);
 fprintf('F1 GD, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_Newton(@F1, @F1_d, @F1_dd, x1, alpha, tol, a, beta, false);
 fprintf('F1 NT, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_Quasi_Newton(@F1, @F1_d, x1, alpha, tol, a, beta, false);
 fprintf('F1 QN, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_Marquardt(@F1, @F1_d, @F1_dd, x1, alpha, tol, a, beta, false);
 fprintf('F1 MQ, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_CG_PolakR(@F1, @F1_d, x1, alpha, tol, a, beta, false);
 fprintf('F1 CG, minima = %d with %d iterations\n',minima, counter);


%Set x2 and Run all methods
 x2 = zeros(100,1);
 Read_Data();
 [x, minima, counter] = UC_Grad_Desc(@F2, @F2_d, x2, alpha, tol, a, beta, true);
 fprintf('F2 GD, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_Newton(@F2, @F2_d, @F2_dd, x2, alpha, tol, a, beta, true);
 fprintf('F2 NT, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_Quasi_Newton(@F2, @F2_d, x2, alpha, tol, a, beta, true);
 fprintf('F2 QN, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_Marquardt(@F2, @F2_d, @F2_dd, x2, alpha, tol, a, beta, true);
 fprintf('F2 MQ, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_CG_PolakR(@F2, @F2_d, x2, alpha, tol, a, beta, true);
 fprintf('F2 CG, minima = %d with %d iterations\n',minima, counter);

 %Set x3 and Run all methods %x3 = [1.3;1.5];
 x3 = [2;1]; 
 [x, minima, counter] = UC_Grad_Desc(@F3, @F3_d, x3, alpha, tol, a, beta, false);
 fprintf('F3 GD, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_Newton(@F3, @F3_d, @F3_dd, x3, alpha, tol, a, beta, false);
 fprintf('F3 NT, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_Quasi_Newton(@F3, @F3_d, x3, alpha, tol, a, beta, false);
 fprintf('F3 QN, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_Marquardt(@F3, @F3_d, @F3_dd, x3, alpha, tol, a, beta, false);
 fprintf('F3 MQ, minima = %d with %d iterations\n',minima, counter);
 [x, minima, counter] = UC_CG_PolakR(@F3, @F3_d, x3, alpha, tol, a, beta, false);
 fprintf('F3 CG, minima = %d with %d iterations\n',minima, counter);


end