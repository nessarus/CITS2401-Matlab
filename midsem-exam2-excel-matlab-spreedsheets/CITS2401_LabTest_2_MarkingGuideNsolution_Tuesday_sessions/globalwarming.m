function [npts] = globalwarming(filename)

%Tuesday session

a = csvread(filename,1,0);
x = a(:,1);
y = a(:,2);
y_mod = y;
rc = find(y == 9);
npts = length(rc);
y_mod(rc)=[];
x_mod = x;
x_mod(rc)=[];
y_new = interp1(x_mod,y_mod,x);
p = polyfit(x,y_new,4);
yp = polyval(p,x);
plot(x,y,x,y_new,x,yp);
legend('original','interpolated','polyfit')
xlabel('Years')
ylabel('Temperature Anomaly')
title('Recorded temperature anomalies since 1880 by NASA')
