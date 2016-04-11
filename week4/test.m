%%
Is = imread('sunflower.tiff');

Ht = [size(Is,1) size(Is,2) 300];
Htabs = [size(Is,1) size(Is,2) 300];


for t = 1 : 300
    tau = t/10;
    Ixx = ifft2(scale(fft2(Is),tau,2,0)).*(tau^2);
    Iyy = ifft2(scale(fft2(Is),tau,0,2)).*(tau^2);
    H = Ixx + Iyy; 
  
    Habs = abs(H);
    Htabs(:,:,t) = Habs;
end

%take maximum values in all H images
Arraycopy = Htabs;
for j = 1:n
   [a, Index(j)] = max(Arraycopy);
   Arraycopy(Index(j)) = -inf;
end
maximumValues = Array(Index);

