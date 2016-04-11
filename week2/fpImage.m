function I2 = fpImage(I)
I2 = zeros(size(I));
C = imChist(I);

for W = 1: size(I,1)
    for L = 1: size(I,2)
        pixel = I(W,L);
        I2(W,L) = C(pixel);
    end
end 
end

