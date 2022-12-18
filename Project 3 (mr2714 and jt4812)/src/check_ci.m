function unbound_ratio = check_ci(N, L, true_stat, dist, dist_params, ...
    ci_type, ci_params)

a_ls = zeros(L, 1);
b_ls = zeros(L, 1);

for l = 1: L
    X = sample(N, dist, dist_params);
    [a, b] = get_ci(ci_type, X, ci_params);
    
    a_ls(l, :) = a;
    b_ls(l, :) = b;
end

captured_count = sum((a_ls <= true_stat) & (b_ls >= true_stat));
unbound_ratio = 1 - captured_count / L;
end
