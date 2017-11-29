function x = oddFive(v)
    x = [];
    for ii=v
        if mod(ii,5)==0 && mod(ii,2)==1
            x = ii;
            break
        end
    end
end