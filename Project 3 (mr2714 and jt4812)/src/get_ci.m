function [a, b] = get_ci(type, X, varargin)
% X - 1 dimensional vector

if type == "hoeffding"
    alpha = varargin{:};
    
    X_mean = mean(X);
    N = length(X);

    EN = sqrt (1 / (2 * N) * log (2 / alpha));
    a = X_mean - EN;
    b = X_mean + EN;

elseif type == "b"
    a = 0;
    b = 0;

elseif type == "check"'
    check_num = varargin{:};
    [a, b] = ci(X, check_num);
else
    error("ci_type not defined")
end

end
    