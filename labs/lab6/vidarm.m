function vidarm(t1, t2, l1, l2)
    ii = 0;
    jj = 0;
    while (ii < t1) && (jj<t2)
        plotarm(ii,jj,l1,l2);
        axis([0, 6, 0, 6]);
        pause(0.01);

        if ii < t1
            ii = ii + 0.005;
        end
        if jj < t2
            jj = jj + 0.005;
        end
    end
end