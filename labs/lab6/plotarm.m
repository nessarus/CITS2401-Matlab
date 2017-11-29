%plots a polygon at an angle.
%created by: Joshua Ng.
function p = plotarm(ang1, ang2, l1, l2)
   x = [0 l1*cos(ang1)];
   x = [x x(2)+l2*cos(ang1+ang2)];
   y = [0 l1*sin(ang1)];
   y = [y y(2)+l2*sin(ang1+ang2)];
   plot(x, y);
   p = [x(3) y(3)];
end