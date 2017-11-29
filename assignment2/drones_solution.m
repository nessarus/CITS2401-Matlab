function [touches, touchlist, ntouchlist] = drones_solution(filename)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
data = csvread(urlwrite(filename,'cody.csv'));
t_list = zeros(1,length(data(:,1)));

touches = 0;
touchlist = [];
ntouchlist = [];

for ii=1:length(data(:,1))
    for jj=ii+1:length(data(:,1))
        eqd = sqrt( sum( (data(ii,1:3) - data(jj,1:3)).^2 ));
        sumr = data(ii,4) + data(jj,4);
        if eqd < sumr
            touches = touches + 1;
            t_list(ii) = 1;
            t_list(jj) = 1;
        end
    end
end
numtouch = 1;
numntouch = 1;

for ii=1:length(data(:,1))
    if t_list(ii) == 1
        touchlist(numtouch).x = data(ii,1);
        touchlist(numtouch).y = data(ii,2);
        touchlist(numtouch).z = data(ii,3);
        touchlist(numtouch).radius = data(ii,4);
        numtouch = numtouch + 1;
    else
        ntouchlist(numntouch).x = data(ii,1);
        ntouchlist(numntouch).y = data(ii,2);
        ntouchlist(numntouch).z = data(ii,3);
        ntouchlist(numntouch).radius = data(ii,4);
        numntouch = numntouch + 1;
    end
end

[x,y,z] = sphere;
figure
subplot(1,2,1)
hold on 
for ii=1:length(touchlist)
    surf(x*touchlist(ii).radius+touchlist(ii).x,y*touchlist(ii).radius+touchlist(ii).y,z*touchlist(ii).radius+touchlist(ii).z)
end
for ii=1:length(ntouchlist)
    surf(x*ntouchlist(ii).radius+ntouchlist(ii).x,y*ntouchlist(ii).radius+ntouchlist(ii).y,z*ntouchlist(ii).radius+ntouchlist(ii).z)
end

title('Reference plot for area of coverage for all drones')
xlabel('Horizontal distance,x (in meters)')
ylabel('Vertical distance,y (in meters)')
zlabel('Height,z (in meters)')
view(45,25)

%figure
subplot(1,2,2)
hold on
for ii=1:length(ntouchlist)
    surf(x*ntouchlist(ii).radius+ntouchlist(ii).x,y*ntouchlist(ii).radius+ntouchlist(ii).y,z*ntouchlist(ii).radius+ntouchlist(ii).z)
end

title('Reference plot for area of coverage for all non-touching drones')
xlabel('Horizontal distance,x (in meters)')
ylabel('Vertical distance,y (in meters)')
zlabel('Height,z (in meters)')
view(45,25)
end

