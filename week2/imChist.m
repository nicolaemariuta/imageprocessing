function C = imChist(I)
H = imhist(I);
C = cumsum(H);
count = size(I,1)*size(I,2);

for i = 1 : size(C)
    C(i) = C(i)/count;
end

end

