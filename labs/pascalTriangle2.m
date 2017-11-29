function y = pascalTriangle2(n)
    y = [1]
    while length(y) < n + 1
        y = [0 y] + [y 0]
    end
end