function z = staircase(a,b,h,n)
    T = 0:pi/20:2*pi*n;
    x = [];
    y = [];
    z = [];
    
    for t = T
        top = a*b*exp(-0.04*t);
        bottom = (b*cos(t))^2+(a*sin(t))^2;
        r = top/sqrt(bottom);
        
        x = [x r*cos(t)];
        y = [y r*sin(t)];
        z = [z h*t/(2*pi*n)];
    end
    plot3(x,y,z);
    
end
