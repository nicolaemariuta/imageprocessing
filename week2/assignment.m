A = ([100,100]);
A(1:100,1:100)= 0.7;

C = imChist(A);



subplot(2,2,1),imshow(A),colormap(gray),title('constant image');
subplot(2,2,2),imhist(A),title('PDF');
subplot(2,2,3),plot(C),title('CDF');

%% 
%1.3
I = imread('pout.tif');

H = imhist(I);
C = imChist(I);

subplot(1,3,1), imshow(I);
subplot(1,3,2), plot(H),title('Hitogram');
subplot(1,3,3), plot(C),title('Cumulative Histogram');

%%
%1.4
I = imread('pout.tif');
subplot(1,3,1), imshow(I),colormap(gray),title('original image');

C = imChist(I);
I2 = fpImage(I);

subplot(1,3,2), imshow(I2),colormap(gray),title('C(I)');
subplot(1,3,3), plot(C);

%%
%1.5
I = imread('pout.tif');

subplot(1,3,1), imagesc(I),colormap(gray);

C = imChist(I);
Cinv = invChist(C);

subplot(1,3,2), plot(C),title('CDF');
subplot(1,3,3), plot([0:1/999:1],Cinv),title('pseudo-inverse');

%%
%1.6
I1 = imread('pout.tif');
C1 = imChist(I1);


I2 = imread('cameraman.tif');
C2 = imChist(I2);


subplot(4,2,1), imshow(I1),colormap(gray),title('image1');
subplot(4,2,2), plot(C1),title('cumulative histogram');;

subplot(4,2,3), imshow(I2),colormap(gray),title('target image');
subplot(4,2,4), plot(C2),title('target cumulative histogram');;

Im = histeq(I1,C2);
C3 = imChist(Im);

subplot(4,2,5), imshow(Im),colormap(gray);
subplot(4,2,6), plot(C3);

C1inv = invChist(C1);
C2inv = invChist(C2);


I4 = zeros(size(I1));

for W = 1: size(I4,1)
    for L = 1: size(I4,2)
        pixel = I1(W,L);
        inv = C1(pixel);
        out = C2inv(max(floor(inv*1000),1));
        I4(W,L) = out;
    end
end 

I4 = uint8(I4);
C4 = imChist(I4);

subplot(4,2,5), imshow(I4),colormap(gray),title('matched image');;
subplot(4,2,6), plot(C4),title('cumulative histogram for result');;

%%
%1.7
I1 = imread('pout.tif');
C1 = imChist(I1);

H = imhist(I1);
H = H*0 + 10;
H = H+10;


C2 = cumsum(H);

count = size(I1,1)*size(I1,2);

for i = 1 : size(C2)
    C2(i) = C2(i);
end



C2inv = invChist(C2);
plot(C2)


I4 = zeros(size(I1));

for W = 1: size(I1,1)
    for L = 1: size(I4,2)
        pixel = I1(W,L);
        inv = C1(pixel);
        out = C2inv(max(floor(inv*1000),1));
        I4(W,L) = out;
    end
end 


I4 = uint8(I4);
C4 = imChist(I4);

subplot(4,2,1), imshow(I1),colormap(gray);
subplot(4,2,2), plot(C1);

subplot(4,2,4), plot(C2);
subplot(4,2,5), imshow(I4),colormap(gray);
subplot(4,2,6), plot(C4);


Im = histeq(I1,C2);
C3 = imChist(Im);



figure;

subplot(1,3,1), imshow(Im),colormap(gray),title('matched image');
subplot(1,3,3), plot(C3),title('rezult histogram');
subplot(1,3,2), plot(C2),title('target histogram');

%%
%1.8
I = imread('pout.tif');

I = imread('D:\master\image processing\week2\movie_flicker1.tif');
I1 = rgb2gray(I);
%I1 = zeros(size(I));
%I1 = I1 + 10;
%I1 = uint8(I1);

I = imread('D:\master\image processing\week2\movie_flicker2.tif');
I2 = rgb2gray(I);
%I2 = zeros(size(I));
%I2 = I2 + 100;
%I2 = uint8(I2);

C1 = imChist(I2);
C2 = imChist(I1);

C1inv = invChist(C1);
C2inv = invChist(C2);



Ctarget = (C1inv + C2inv)/2;


I4 = zeros(size(I1));


for W = 1: size(I4,1)
    for L = 1: size(I4,2)
        pixel = I1(W,L);
        inv = C1(pixel+1);
        
        I4(W,L) = Ctarget(max(floor(inv*1000),1));
    end
end 

I4 = uint8(I4);
C4 = imChist(I4);


subplot(4,2,1), imshow(I1),colormap(gray),title('target');
subplot(4,2,2), plot(C1);
subplot(4,2,3), imshow(I2),colormap(gray),title('image');
subplot(4,2,4), plot(C2);
subplot(4,2,5), imshow(I4),colormap(gray),title('midway specification');
subplot(4,2,6), plot(C4);


%%
%2.3
I = imread('eight.tif');
subplot(1,3,1),imshow(I),title('original');
Isp=imnoise(I,'salt & pepper',0.03);
subplot(1,3,2),imshow(Isp),title('salt&pepper');
Ig=imnoise(I,'gaussian',0.02);
subplot(1,3,3),imshow(Ig),title('gaussian');
figure;
%mean
tic;
for i = 1 : 100
k = ones(6,6)/36;
Im =imfilter(I,k);
Ispm = imfilter(Isp,k);
Igm = imfilter(Ig, k);
subplot(1,3,1),imshow(Im),title('original');
subplot(1,3,2),imshow(Ispm),title('salt&pepper');
subplot(1,3,3),imshow(Igm),title('gaussian');
end
toc;

%median

figure;

In = medfilt2(I,[25,25]);
Ispn = medfilt2(Isp,[25,25]);
Ign = medfilt2(Ig,[6,6]);
subplot(1,3,1),imshow(In),title('original');
subplot(1,3,2),imshow(Ispn),title('salt and pepper');
subplot(1,3,3),imshow(Ign),title('gaussian');

%%
%2.4
I = imread('eight.tif');
subplot(1,3,1),imshow(I),title('original');
Isp=imnoise(I,'salt & pepper',0.03);
subplot(1,3,2),imshow(Isp),title('salt&pepper');
Ig=imnoise(I,'gaussian',0.02);
subplot(1,3,3),imshow(Ig),title('gaussian');
figure;

k = fspecial('gaussian',[7 7],2);
Ig =imfilter(I,k);
Ispg = imfilter(Isp,k);
Igg = imfilter(Ig, k);
subplot(1,3,1),imshow(Ig),title('original');
subplot(1,3,2),imshow(Ispg),title('salt&pepper');
subplot(1,3,3),imshow(Igg),title('gaussian');


