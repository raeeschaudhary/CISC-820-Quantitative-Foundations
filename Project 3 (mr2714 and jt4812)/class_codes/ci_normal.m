N = 10; % number of samples for mean
alpha = 0.05;
ep = 1.96946;

L = 100000; % number of experiments to check for confidence interval 

theta_bern = 0.5;

X_samples = sample_bernoulli(L * N, theta_bern);
X_samples = reshape(X_samples, L, N);

X_means = mean(X_samples, 2);

EN = sqrt(theta_bern * (1 - theta_bern) / N) * ep;

ANs = X_means - EN;
BNs = X_means + EN;

captured_count = sum((ANs <= theta_bern) & (BNs >= theta_bern));
disp(1 - captured_count / L);