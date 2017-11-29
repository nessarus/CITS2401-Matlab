function [touches, touchlist, ntouchlist] = drones(fileLink)
    % number of drone touches
    touches = 0;

    % struct fields for touchlist
    x_tl = {};  % 'x' field
    y_tl = {};  % 'y' field:
    z_tl = {};  % 'z' field:
    r_tl = {};  % 'r' field:
    
    % struct fields for touchlist
    x_ntl = {};  % 'x' field
    y_ntl = {};  % 'y' field:
    z_ntl = {};  % 'z' field:
    r_ntl = {};  % 'r' field:
    
    % r{end+1} = M(ii/jj,2)

    % read drone file line by line
    M = dlmread(fileLink, ',');
    for ii = 1:size(M,1)
%         x1 = M(ii,1);
%         y1 = M(ii,2);
%         z1 = M(ii,3);
        
        % campare other drones
         d1_touch = false;   % need to remember if drone 1 touched
%         for jj = 1:size(M(ii:end,:),1)
%             x2 = M(jj,1);
%             y2 = M(jj,2);
%             z2 = M(jj,3);
%             
%             x = x1 - x2;
%             y = y1 - y2;
%             z = z1 - z2;
%             
%             is drone touching?
%             if r*r >= (x*x + y*y + z*z) 
%                 x{end+1} = M(ii/jj,1);
%                 y{end+1} = M(ii/jj,2);
%                 z{end+1} = M(ii/jj,3);
%             end
%         end
        
        % if drone 1 did not touch any drone
        % store into ntouchlist fields
        if(not(d1_touch))
            x_ntl{end+1} = M(ii,1);
            y_ntl{end+1} = M(ii,2);
            z_ntl{end+1} = M(ii,3);
            r_ntl{end+1} = M(ii,4);
        end
    end
    
    % store into structs
    ntouchlist = struct('x',x_ntl,'y',y_ntl,'z',z_ntl,'radius',r_ntl);
    touchlist = struct('x',x_tl,'y',y_tl,'z',z_tl,'radius',r_tl);
end