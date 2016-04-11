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

C1 = imChist(I1);
C2 = imChist(I2);

C1inv = invChist(C1);
C2inv = invChist(C2);



Ctarget = (C1inv + C2inv)/2;


I4 = zeros(size(I1));


for W = 1: size(I1,1)
    for L = 1: size(I1,2)
        pixel = I1(W,L);
        pixel = pixel+1;
        inv = C1(pixel);
        
       
        I4(W,L) = Ctarget(max(floor(inv*1000),1));
    end
end 

I4 = uint8(I4);
C4 = imChist(I4);


subplot(4,2,1), imshow(I1),colormap(gray);
subplot(4,2,2), plot(C1);
subplot(4,2,3), imshow(I2),colormap(gray);
subplot(4,2,4), plot(C2);
subplot(4,2,5), imshow(I4),colormap(gray);
subplot(4,2,6), plot(C4);

%%
%2.1





