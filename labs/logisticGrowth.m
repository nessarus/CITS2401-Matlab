function [Nmax,yrs,N] = logisticGrowth(N0,K,r)
    Pervious = N0-1;
    Next = N0;
    yrs = 0;
    N = [];
    while Next ~= Pervious
        Pervious = Next;
        Next = round(r * Pervious * (1 - Pervious/K));
        yrs = yrs + 1;
        N = [N Next];
    end
    Nmax = max(N);
end