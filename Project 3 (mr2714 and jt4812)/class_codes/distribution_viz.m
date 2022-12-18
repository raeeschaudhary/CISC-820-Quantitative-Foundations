% Bernoulli distribution
N = 10000;
theta = 0.1;

ber_samples = sample_bernoulli(N, theta);
% hist(ber_samples);
% wait()

% Gaussian distribution
mu = 10;
sigma = 3;
nor_samples = sample_normal(N, sigma, mu);
hist(nor_samples, 10);
% wait()


% Uniform distribution
a = 5;
b = 12;
uni_samples = sample_uniform(N, a, b);
% hist(uni_samples);
% wait()
