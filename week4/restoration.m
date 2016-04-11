%1
%create I(x,y,s)
s = 10;
t = 6;
Is = fspecial('gaussian', [100 100], s);
It = fspecial('gaussian', [100 100], t);
Ist = fspecial('gaussian', [100 100], sqrt(s^2+t^2));

convfft = scale(fft2(Is),t,0,0);
conv = ifft2(convfft);
diff = Ist-conv;

subplot(2,3,1),imagesc(Is),title('Is'),colormap(gray);
subplot(2,3,2),imagesc(It),title('It'),colormap(gray);
subplot(2,3,3),imagesc(Ist),title('Ist'),colormap(gray);
subplot(2,3,4),imagesc(conv),title('conv'),colormap(gray);
subplot(2,3,5),imagesc(diff),title('diff'),colormap(gray);

disp(sum(diff));


%%
%2
%c
s = 10;

Is = fspecial('gaussian', [100 100], s);
H00 = zeros([300]);

for t = 1 : 300
    tau = t/10;
    Ixx = ifft2(scale(fft2(Is),tau,2,0)).*(tau^2);
    Iyy = ifft2(scale(fft2(Is),tau,0,2)).*(tau^2);
    H = Ixx + Iyy;
    H00(t) = H(size(H,1)/2,size(H,2)/2);   
end

plot([0.1:0.1:30],H00);

%%
Is = imread('sunflower.tiff');

Ht = zeros(size(Is,1),size(Is,2),300);
Htabs = zeros(size(Is,1),size(Is,2),300);


for t = 1 : 300
    tau = t/10;
    Ixx = ifft2(scale(fft2(Is),tau,2,0)).*(tau^2);
    Iyy = ifft2(scale(fft2(Is),tau,0,2)).*(tau^2);
    H = Ixx + Iyy;
    Ht(:,:,t) = H;
    Habs = abs(H);
    Htabs(:,:,t) = Habs;
end

[sorted,sortingIndices] = sort(Habs(),'descend');
maxValues = sorted(1:20);
maxValueIndices = sortingIndices(1:20);


imshow(Is);
hold on;

for i = 1 : 20
    [x,y,t]=sub2ind(size(Habs), find(Habs==maxValues(i)));
    scatter()
end

hold off;


%%
%4
I = imread('lena.tiff');
subplot(2,4,1);imshow(I);colormap(gray);title('original');
%convolve with gaussian kernel
H = fspecial('gaussian', size(I), 3);
Ic = mat2gray(abs(ifft2(fft2(I).*H)));
subplot(2,4,2);imagesc(Ic);colormap(gray);title('original**kernel');
%add noise
Icn =imnoise(Ic,'gaussian',0,0.002);
subplot(2,4,3);imagesc(Icn);colormap(gray);title('original**kernel+noise');

%5

Icfft = fftshift(fft2(Ic));
Imfft = Icfft./H;
Im = abs(ifft2(Imfft));

subplot(2,4,4);imagesc(Im);colormap(gray);title('inverse filter');

%%
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



