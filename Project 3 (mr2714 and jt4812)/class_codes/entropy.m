for n = 1: 10
    [expec, var, entr] = YN(n);
    fprintf('Expectation %f Variance %f Entropy %f', expec, var, entr);

    fprintf("\n")
end
