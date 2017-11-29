function y = hailstone(m)
    step = 0;
    n = m;
    while n>1
        if mod(n,2)==0
            n = n/2;
        else
            n = 3*n+1;
        end
        step = step + 1;
    end
    y = step;
end