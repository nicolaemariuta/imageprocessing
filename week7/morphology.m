%2 opening
I = load('TestImageQn2.mat');
I = I.TestImageQn2;

cross = strel('diamond',3);

I1  = imerode(I,cross);
I2  = imdilate(I1,cross);

subplot(1,3,1);imshow(I);title('image');
%subplot(1,3,2);imshow(I1);title('erode');
subplot(1,3,3);imshow(I2);title('diamond 3');

%%
%2 closing
I = load('TestImageQn2.mat');
I = I.TestImageQn2;


cross = strel('diamond',3);


I1  = imdilate(I,cross);
I2  = imerode(I1,cross);

subplot(1,3,1);imshow(I);title('image');
%subplot(1,3,2);imshow(I1);title('dilate');
subplot(1,3,3);imshow(I2);title('diamond 3');

%%
%3 hit and miss
I = imread('blobs.png');


B1 = strel('line',2, 0);
B2 = strel('diamond',2);


I1  = imerode(I,B1);
I2  = imerode(I,B2);
Im  = and(I1,I2);


subplot(2,2,1);imshow(I);title('original image');
subplot(2,2,2);imshow(I1);title('erode with octagon');
subplot(2,2,3);imshow(I2);title('erode with diamond');
subplot(2,2,4);imshow(Im);title('and');

%%
% 3 top hat   
I = imread('lena.tiff');

B1 = strel('diamond',3);


I1  = imerode(I,B1);
I2  = imdilate(I1,B1);
Im  = I - I2;

subplot(1,3,1);imshow(I);title('original image');
subplot(1,3,2);imshow(Im);title('top hat');

%%

subplot(2,2,1);imshow(I);title('original image');
subplot(2,2,2);imshow(I1);title('erodion');
subplot(2,2,3);imshow(I2);title('dilate');
subplot(2,2,4);imshow(Im);title('substract');

%%
%3 buttom hat   
I = imread('blobs.png');
I = imread('lena.tiff');

B1 = strel('diamond',3);

I1  = imdilate(I,B1);
I2  = imerode(I1,B1);
Im  = I2 - I;
subplot(1,3,3);imshow(Im);title('buttom hat');

%%
subplot(2,2,1);imshow(I);
subplot(2,2,2);imshow(I1);
subplot(2,2,3);imshow(I2);
subplot(2,2,4);imshow(Im);

%%
%4 background normalization  using top hat
I = imread('rice.png');

B1 = strel('disk',8,6);

I1  = imerode(I,B1);
I2  = imdilate(I1,B1);
Im  = I - I2;

subplot(1,3,1);imshow(I);title('original image');
subplot(1,3,3);imshow(Im);title('background normalization disk 4,0');

%%
%5 hit-miss   digit 5
I = imread('test_digits.bmp');
B1 = imread('five.bmp');

%dilation of B1
b = strel('disk',1,0);
B1d = imdilate(B1,b);

B2 = ~B1d;
Im  = bwhitmiss(I,B1,B2);

[i,j] = find(Im == 1);

%subplot(2,2,1);imagesc(I);title('test_digits.bmp');
%subplot(2,2,2);imagesc(B1);title('five.bmp');
subplot(1,3,1);imshow(I);hold on; plot(j,i,'r*');title('detection of 5');


%%
%4 background normalization  using top hat
I = imread('rice.png');

B1 = strel('disk',1,0);

I1  = imerode(I,B1);
I2  = imdilate(I1,B1);
Im  = I - I2;

subplot(2,2,1);imshow(I);
subplot(2,2,2);imshow(I1);
subplot(2,2,3);imshow(I2);
subplot(2,2,4);imshow(Im);

%%
%5 hit-miss   digit 0
I = imread('test_digits.bmp');


B1 = imread('zero.bmp');



%dilation of B1
b = strel('disk',1,0);
B1d = imdilate(B1,b);


B2 = ~B1d;


%I1  = imerode(I,B1);
%I2  = imerode(I,B2);
Im  = bwhitmiss(I,B1,B2);

[i,j] = find(Im == 1);


subplot(1,3,2);imshow(I);hold on; plot(j,i,'r*');title('detection of 0');


%%
%5 hit-miss   digit 3
I = imread('test_digits.bmp');


B1 = imread('three.bmp');



%dilation of B1
b = strel('disk',2,0);
B1d = imdilate(B1,b);


B2 = ~B1d;


%I1  = imerode(I,B1);
%I2  = imerode(I,B2);
Im  = bwhitmiss(I,B1,B2);

[i,j] = find(Im == 1);


subplot(1,3,3);imshow(I);hold on; plot(j,i,'r*');title('detection of 3');


%%
%5 hit-miss   digit 0 scale and rotate
I = imread('test_digits.bmp');
I = imrotate(I,45);
I = imresize(I,2);

B1 = imread('zero.bmp');
B1 = imrotate(B1,45);
B1 = imresize(B1,2);


%dilation of B1
b = strel('disk',3,0);
B1d = imdilate(B1,b);


B2 = ~B1d;


%I1  = imerode(I,B1);
%I2  = imerode(I,B2);
Im  = bwhitmiss(I,B1,B2);

[i,j] = find(Im == 1);

subplot(2,2,1);imagesc(I);
subplot(2,2,2);imagesc(B1);
subplot(2,2,3);imshow(I);hold on; plot(j,i,'r*');

%%
%6
%read image
I = imread('flowers.jpg');
subplot(2,2,1);imshow(I);title('original image');
%convert to greyscale
I = rgb2gray(I);
subplot(2,2,2);imshow(I);title('greyscale image');
%blur the image
filter = fspecial('gaussian',[250 250],150);
I =I - imfilter(I,filter);
subplot(2,2,3);imshow(I);title('blurred image');
%edge detection
se = strel('disk',3,0);
Amax = imdilate(I,se);
Amin = imerode(I,se);
Mgrad = Amax - Amin;
subplot(2,2,4);imshow(I);title('edge detection');

%dilation and erodion
se = strel('disk',3,8);
Mgrad2 = imerode(Mgrad,se);
Mgrad3 = imdilate(Mgrad2,se);
subplot(1,2,1);imshow(Mgrad3);
%make image binary by using threshold
mask = im2bw(Mgrad3,0.1);


%apply mask
figure;
h = imshow(imread('flowers.jpg'));
set(h, 'alphadata',mask);