function random_funs = random_ci_check()

N = 10000; % number of samples for mean
L = 1000; % number of experiments to check for confidence interval 

theta_bern = 0.5;

rng(999);
X_samples = sample_bernoulli(L * N, theta_bern);
X_samples = reshape(X_samples, L, N);

random_funs = zeros(10, 1);

for f = 1: 10
    miss_rates = [0, 0];
    
    for delta = [1, 2]
        captured_count = 0;

        for l = 1: L
            rng(l * 100 + delta * 50);

            samples_ = X_samples(l, :);
            [a, b] = ci(samples_, f);
            captured_count = captured_count + ((a <= theta_bern) & (theta_bern <= b));
        end

        miss_rate = 1 - captured_count / L;
        miss_rates(delta) =  miss_rate;
    end
    is_random = (miss_rates(1) ~= miss_rates(2));
    % fprintf("%f %f %d\n", miss_rates(1), miss_rates(2), is_random);
    random_funs(f, :) = is_random;
end