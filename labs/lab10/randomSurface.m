Z0 = [0.5 0.65 0.35 0.90 0.80;

        0.75 0.60 0.35 0.60 0.20;

        0.50 0.60 0.20 0.65 0.45;

        0.35 0.95 0.65 0.95 0.25;

        0.20 0.05 0.35 0.70 0.60];
[X0, Y0] = meshgrid(1:5);

[X1, Y1] = meshgrid(1:0.1:5);
Z1 = interp2(X0,Y0,Z0,X1,Y1, 'cubic');
surf(X1,Y1,Z1);
colormap cool
shading interp
hold on
contour(X1,Y1,Z1,15)
colorbar
hold off