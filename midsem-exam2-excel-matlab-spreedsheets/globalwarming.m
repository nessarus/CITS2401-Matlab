function [npts] = globalwarming(filename)
%Joshua Chin Hao Ng, 20163079
M = csvread(filename,1,0);
year = M(:,1)';
anomaly = M(:,2)';


%replace 9
replace = [];
ii = 1;
while ii<length(year)+1
    if anomaly(ii)==9
        replace = [replace year(ii)];
        year(ii) = [];
        anomaly(ii) = [];
    end
    ii = ii + 1;
    ii
end

%interp missing data
year_interp = year;
anomaly_interp = anomaly;
for jj = replace
    year_interp = [year_interp jj];
    anomaly_interp = [anomaly_interp interp1(year, anomaly, jj)];

end

%polyno
x = year_interp';
y = anomaly_interp';
X = [x.^4 x.^3 x.^2 x ones(size(x))];
b = X\y;
b = b';

%plot
new_x = min(M(:,1)):0.1:max(M(:,1));
new_y = polyval(b, new_x);

hold on
plot(M(:,1), M(:,2), 'o');
plot(x,y, 'x');
plot(new_x,new_y);
title('Temperature anomalies of global mean surface temperature');
xlabel('year');
ylabel('temperature');
hold off

npts = length(replace);
end