function [x, minima, counter] = UC_CG_PolakR(F, F_d, x, alpha, tol, a, beta, test)
%Gradeint Descent With Line Search
%placed guard on iterations and tolerance (tol)
max_iter = 1000;
deri = F_d(x);
delta = -deri;
acc = [F(x)];
counter = 0;
while true
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
    if norm(F_d(x_step)) < tol 
        break;
    end
    if counter >= max_iter
        break;
    end
    x = x_step;
    d = deri;
    deri = F_d(x_step);
    chi = ((deri-d)'.*deri)./norm(d).^2;
    chi = max(0, chi);
    %norm(deri).^2/norm(d).^2; (D-d).dot(D)/NORM(d)**2 
    delta = -deri + chi*delta;
    counter = counter + 1;
end
minima = F(x);
fig = plot(acc, 'LineWidth',2);
xlabel('# iteration', 'FontSize', 20);
ylabel('f(x)', 'FontSize', 20);
%saveas(fig,'Polak.png');
end