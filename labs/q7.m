N = 7:7:1000;
for ii = 2:6
    r = rem(N,ii) ~= 1;
    N(r) = []
end