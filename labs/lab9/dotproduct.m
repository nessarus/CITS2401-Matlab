function result = dotproduct(P1,P2)
    result = sum(sum(sum(P1.*P2,1),2),3);
end