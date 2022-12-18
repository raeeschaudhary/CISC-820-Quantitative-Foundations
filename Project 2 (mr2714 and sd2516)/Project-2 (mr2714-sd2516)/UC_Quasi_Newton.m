function [x, minima, counter] = UC_Quasi_Newton(F, F_d, x, alpha, tol, a, beta, test)
%Gradeint Descent With Line Search
%placed guard on iterations and tolerance (tol)
max_iter = 1000;
F_Mat = eye(length(x));
counter = 0;
acc = [F(x)];
while true
    deri = F_d(x);
    delta = -F_Mat*deri;
    step_alpha = alpha;
    if (test == false)
        while (F(x+step_alpha*delta) >  F(x) + (a*step_alpha*dot(deri, delta)))
            step_alpha = step_alpha * beta;
        end
    else
        global A B;
        test = B > A*(x + step_alpha*delta);
        while  (F(x+step_alpha*delta) >  F(x) + (a*step_alpha*dot(deri, delta))) || ~(all(test))
            step_alpha = step_alpha * beta;
            test = B > A*(x + step_alpha*delta);
        end
    end
    x_step = x + delta*step_alpha;
    acc = [acc, F(x_step)];
    if abs(F(x_step) - F(x)) < tol
        break;
    end
    if counter >= max_iter
        break;
    end
    s = x_step - x;
    y = F_d(x_step) - deri;
    F_Mat = F_Mat + ((y'*(F_Mat*y + s))/(y'*s)^2)*(s*s') - (s*y'*F_Mat + F_Mat*y*s')/(y'*s);
    x = x_step;
    counter = counter + 1;
end
minima = F(x);
fig = plot(acc, 'LineWidth',2);
xlabel('# iteration', 'FontSize', 20);
ylabel('f(x)', 'FontSize', 20);
%saveas(fig,'QN.png');
end