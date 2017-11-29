function [touches, touchlist, ntouchlist] = drones(fileLink)
    % open url 
    t_M = tempname;
    urlwrite(fileLink,t_M);
    M = csvread(t_M);
    
    % number of drone touches
    touches = 0;
    
    % logical touchlist matrix
    tl_logic = false(1,size(M,1));
    
    % read drone file line by line
    for ii = 1:size(M,1)
        x1 = M(ii,1);
        y1 = M(ii,2);
        z1 = M(ii,3);
        r1 = M(ii,4);
        
        % campare drone ii with other drones
        for jj = ii+1:size(M,1)
            x2 = M(jj,1);
            y2 = M(jj,2);
            z2 = M(jj,3);
            r2 = M(jj,4);
            
            x = x1 - x2;
            y = y1 - y2;
            z = z1 - z2;
            r = r1 + r2;
            
            % are the drones touching?
            if r*r >= (x*x + y*y + z*z)
                tl_logic(ii) = true;
                tl_logic(jj) = true;
                touches = touches + 1;
            end
        end
    end
    
    % store drones into fields
        % struct fields for touchlist
    x_tl = num2cell(M(tl_logic,1)');
    y_tl = num2cell(M(tl_logic,2)');
    z_tl = num2cell(M(tl_logic,3)');
    r_tl = num2cell(M(tl_logic,4)');
    
        % struct fields for touchlist
    x_ntl = num2cell(M(not(tl_logic),1)');
    y_ntl = num2cell(M(not(tl_logic),2)');
    z_ntl = num2cell(M(not(tl_logic),3)');
    r_ntl = num2cell(M(not(tl_logic),4)');
    
    % store into structs
    ntouchlist = struct('x',x_ntl,'y',y_ntl,'z',z_ntl,'radius',r_ntl);
    touchlist = struct('x',x_tl,'y',y_tl,'z',z_tl,'radius',r_tl);
    
    % subplot for all drones
    subplot(1,2,1)
    hold on
    for ii = 1:size(M,1)
        [x,y,z] = sphere;
        x1 = M(ii,1);
        y1 = M(ii,2);
        z1 = M(ii,3);
        r1 = M(ii,4);
        
        surf(r1*x+x1, r1*y+y1, r1*z+z1);
    end
    
    % label subplot all drones
    title('Reference plot for area of coverage for all drones')
    xlabel('Horizontal distance, x (in meters)');
    ylabel('Vertical distance, y (in meters)');
    zlabel('Height, z (in meters)');
    
    % find a fix scale for both plots
    max_r = max(M(:,4));
    
    max_x = max(M(:,1)) + max_r;
    max_y = max(M(:,2)) + max_r;
    max_z = max(M(:,3)) + max_r;
        
    min_x = min(M(:,1)) - max_r;
    min_y = min(M(:,2)) - max_r;
    min_z = min(M(:,3)) - max_r;
        
    axis([ min_x,max_x, min_y,max_y, min_z,max_z ]);
    view(37.5,30);
    hold off
    
    % subplot for non-touching drones
    subplot(1,2,2)
    hold on
    N = M(not(tl_logic),:); % matrix for non touching drones
    
    for ii = 1:size(N,1)
        [x,y,z] = sphere;
        x1 = N(ii,1);
        y1 = N(ii,2);
        z1 = N(ii,3);
        r1 = N(ii,4);
        
        surf(r1*x+x1, r1*y+y1, r1*z+z1);
    end
    
    % label subplot all drones
    title('Reference plot for area of coverage for all non-touching drones');
    xlabel('Horizontal distance, x (in meters)');
    ylabel('Vertical distance, y (in meters)');
    zlabel('Height, z (in meters)');
    
    % fix scale
    axis([ min_x,max_x, min_y,max_y, min_z,max_z ]);
    view(37.5,30);
    hold off
    
end

    
    
    
    
    
    
    
    
    
    
    
    
    
    