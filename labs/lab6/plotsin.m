%plots a polygon at an angle.
%created by: Joshua Ng.
function plotsin(deg)
   ang = 0:pi/3:2*pi;
   ang = ang + deg/360*2*pi;
   sines = sin(ang);
   cosines = cos(ang);
   plot(cosines, sines);
end