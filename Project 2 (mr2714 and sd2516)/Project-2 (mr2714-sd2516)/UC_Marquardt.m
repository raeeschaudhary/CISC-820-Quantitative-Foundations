function [x, minima, counter] = UC_Marquardt(F, F_d, F_dd, x, alpha, tol, a, beta, test)
%Marquardt Method is a combination of GD and Newton
%placed guard on iterations and tolerance (tol)
max_iter = 1000;
counter = 0;
gamma = 0.5;
I = eye(length(x));
acc = [F(x)];
while true
    deri = F_d(x);
    deri2 = F_dd(x);
    deri22 = deri2 + gamma*I;
    delta = -deri22^(-1)*deri;
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
    x = x_step;
    counter = counter + 1;
end
minima = F(x);
fig = plot(acc, 'LineWidth',2);
xlabel('# iteration', 'FontSize', 20);
ylabel('f(x)', 'FontSize', 20);
%saveas(fig,'Marq.png');
end