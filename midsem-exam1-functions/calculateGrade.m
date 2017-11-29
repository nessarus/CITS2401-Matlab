%Created by: Joshua Ng
%Student number: 20163079
function g = calculateGrade(A)
    b = mean(A);
    if b<45
        g = 'N';
    elseif b<50
        g = 'N+';
    elseif b<60
        g = 'P';
    elseif b<70
        g = 'CR';
    elseif b<80
        g = 'D';
    else
        g = 'HD';
    end
end 