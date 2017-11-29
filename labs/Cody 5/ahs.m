function ln2 = ahs(n)
    new = 1;
    old = 0;
    i = 2;
    while (abs(new-old)>n)
        old = new;
        if (mod(i,2)==0) 
            new = (old -(1/i));
        else
            new = old +1/i;
        end
        i = i + 1;
    end
    ln2 = new;
end