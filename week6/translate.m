function T = translate( I, x, y )

T = I;

for i = 1 : abs(x)
    if (x < 0)
        F = [0,0,1];
        T = imfilter(T,F,'replicate');
    end
    if (x > 0)
        F = [1,0,0];
        T = imfilter(T,F,'replicate');
    end
   
end

for i = 1 : abs(y)
    if (y < 0)
        F = [1;0;0];
        T = imfilter(T,F,'replicate');
    end
    if (y > 0)
        F = [0;0;1];
        T = imfilter(T,F,'replicate');
    end
   
end



end

