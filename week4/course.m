%restoration using inverse filtering
A = imread('lena.tiff');B=fft2(A);B=fftshit(B);
[x y]=size(A); [X Y]=meshgrid(1:x,1:y);
h = exp(-(X-x/2).^2./48).*exp(-(Y-y/2).^2./48);
H=psf2otf(h,size(h));H=fftshift(H);
g=ifft2(B.*H);g=abs(g);

G=fft2(g);G=fftshift(G);
indices=find(H>1e-6);
F=zeros(size(G));F(indices)=G(indices)./H(indices);
f=ifft2(F);f=abs(f);
subplot(1,4,1),imshow(g,[min(min(g)) max(max(g))]);
subplot(1,4,2),imgaesc(h);axis square; afis off;
subplot(1,4,3),imgaesc(abs(H));axis square; afis off;
subplot(1,4,4),imgaesc(f);axis square; axis tight;afis off;