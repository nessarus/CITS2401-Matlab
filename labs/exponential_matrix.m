function result  = exponential_matrix(x)
    result = ones(size(x));
    n = 1;
    term = x;
    while term > 0.01
        term = x.^n./factorial(n);
        result = result + term;
        n = n + 1;
    end
end