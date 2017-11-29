function y = question1(n)
    steps = 0;
    while n>1
        if rem(n,2)==0
            n = n/2;
        else
            n = n*3 +1;
        end
        steps = steps +1;
    end
    y = steps;
end