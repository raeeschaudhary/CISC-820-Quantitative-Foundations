function X = sample(N, dist, params)

if dist == "uniform"
    a = params(1);
    b = params(2);
    X = sample_uniform(N, a, b);

elseif dist == "gaussian"
    mu = params(1);
    sig = params(2);
    X = sample_normal(N, sig, mu);

elseif dist == "bernoulli"
    c = params;
    X = sample_bernoulli(N, c);
else
    error("distribution type not defined");
end