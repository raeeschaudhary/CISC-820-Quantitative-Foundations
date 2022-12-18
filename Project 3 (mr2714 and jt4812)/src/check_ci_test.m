theta_space = [0.5, 0.01, 0.98];

dist = "bernoulli";

N_space = [100, 1000, 10000];
L = 10000;
fprintf("\t\tber(%1.2f)\t\tber(%1.2f)\t\tber(%1.2f)\t\n", theta_space(1), ...
     theta_space(2), theta_space(3));
fprintf("Fun no\t %5d\t%5d\t%5d\t%5d\t%5d\t%5d\t%5d\t%5d\t%5d\n", ...
    N_space(1), N_space(2), N_space(3), ...
    N_space(1), N_space(2), N_space(3), ...
    N_space(1), N_space(2), N_space(3));
for fun_no = 1: 10
    fprintf("%2d \t", fun_no)
    
    for theta = theta_space
        for N = N_space
            unbounded_ratio = check_ci(N, L, theta, dist, theta, ...
                "check", fun_no);
            
            fprintf("%1.4f\t", unbounded_ratio);
        end
    end

    fprintf("\n");
end