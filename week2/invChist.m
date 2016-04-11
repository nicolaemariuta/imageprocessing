function Cinv = invChist(C)
Cinv = (1000);

for i = 1: 1000
    l = (i-1)/999;
    for j = 1:255
        if(C(j)>=l)
            Cinv(i) = j;
            break
        end
    end
 end

end