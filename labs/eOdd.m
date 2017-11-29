function [a] = eOdd(b)
    sum = 0;
    for i=1:2:length(b)
        sum = sum + b(i);
    end
    a = sum;
end
        