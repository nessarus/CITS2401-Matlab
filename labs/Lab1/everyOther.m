function y = everyOther(x)
    y = {};
    for i = 1:2:length(x)
        y{end+1} = x(i);
    end
end