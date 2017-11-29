function y = partB(x, kmax)
    if ~exist('kmax', 'var')
        kmax = 100;
    end

    A = 0;
    k = 1;
    sign = 1;
    while (k~=kmax) && (k <= 100)
        A = A + sign*1/(k^2);
        sign = sign*-1;
        k = k + 1;
    end
    y = A * x;
    t = nargout(@partB)
end
