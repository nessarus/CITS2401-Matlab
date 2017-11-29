function y = pascalTriangle(n)
    if n == 0
        y = [1];
    else
        x = pascalTriangle(n-1);
        y = [1];
        i = 2;
        while i<(n+1)
            y = [y (x(i)+x(i-1))];
            i=i+1;
        end
        y = [y 1];
    end
end