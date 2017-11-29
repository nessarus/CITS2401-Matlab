function y = pascalTrigangle2(n)
    y = [1]
    while length(y) < n
        y = [0 y] + [y 0]
    end
end