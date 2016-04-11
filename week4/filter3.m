function B2 = filter3( B, kernel )
[Rimage,Cimage]=size(B);
[Rkernel,Ckernel]=size(kernel);

B2 = zeros(Rimage,Cimage);

for R = 1: Rimage-Rkernel
    for C = 1: Cimage-Ckernel
        middle = 0;
        for r = 1: Rkernel
            for c = 1: Ckernel
                middle = middle + double(B((R+r),(C+c)))*double(kernel(r,c));
            end
        end
        B2(R,C)= middle;
    end
end

end

