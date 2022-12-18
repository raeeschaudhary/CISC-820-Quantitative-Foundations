cheN = 10;
a = - sqrt(3);
b = sqrt(3);

L = 100000;

Xis = sample_uniform(L * N, a, b);
Xis = reshape(Xis, L, N);

Y = sum(Xis, 2) / sqrt(N);

expectation = mean(Y);
variance = var(Y);
entropy = estimate_entropy(Y);