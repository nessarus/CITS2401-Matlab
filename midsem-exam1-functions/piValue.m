%Name:              Joshua Ng
%Student Number:    20163079
function y = piValue(n)
    if n < 1
        y = 0;
        return
    else
        ii = 0;
        y = 0;
        while ii < n
            if mod(ii,2)==0
                y = y + 4/(1+2*ii);
            else
                y = y - 4/(1+2*ii);
            end
            ii = ii + 1;
        end
    end
end