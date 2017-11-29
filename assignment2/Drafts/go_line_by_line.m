M = dlmread('drone.csv', ',');

for ii = 1:size(M,1)
    for jj = 1:size(M(ii:end,:),1)
       % do something. 
    end
end
