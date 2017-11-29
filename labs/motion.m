function [ dist, vel, accel ] = motion( t )
% This function calculates the distance, velocity, and
% acceleration of a particular car for a given value of t
% assuming all 3 parameters are initially 0.
accel = 0.5 .*t;
vel = t.^2/4;
dist = t.^3/12;
end

