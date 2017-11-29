function [ total ] = cof1( x )
%cof1 calculates the formula cos(x)^2+x^0.5+x/2
    total = cos(x).^2 + sqrt(x) + x/2;
end

