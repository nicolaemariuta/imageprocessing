%1.1
A = rand([20 20]); %Generate random image
imagesc(A),colormap(gray);
xlabel('X');
ylabel('Y');

while (true)  %Infinite loop to read clicked pixel
    [xVector,yVector] = ginput(1);  
    x = int64(xVector(1));  %coordinates of clicked pixel
    y = int64(yVector(1));
    disp(sprintf('X=%u', y));  %display coordinates in console
    disp(sprintf('Y=%u', x));
    A(y,x) = 0;                 %change clicked pixel color to black
    imagesc(A),title(sprintf('Clicked (X=%u,Y=%u)',y,x)); %show image again with changed pixel color
    xlabel('X');
    ylabel('Y');
end
%%
%1.2
A = imread('D:\master\image processing\examples\onion.png');

subplot(3,1,1);imshow(A),title('imageshow');
subplot(3,1,2);image(A),title('image');
subplot(3,1,3);imagesc(A),title('imagesc');
%%
range = 1000;
B = rand([100 100])*range;  %generate random image

subplot(1,3,1);imshow(B),title('imageshow'), colormap(gray);
subplot(1,3,2);image(B),title('image');
subplot(1,3,3);imagesc(B),title('imagesc');

%%
%1.3
A = imread('cameraman.tif');   %load image
subplot(5,2,1);imshow(A),axis off,title('original'); %display original image

for index = 1 : 8  
    slice = bitget(A,index) %use bitget function to obtain the bit plane
    subplot(5,2,index+1);imshow(slice, []),colormap(gray),title(sprintf('bit%u',index));  
end



%%
%1.4
A = imread('D:\master\image processing\examples\onion.png');

if(ndims(A) == 3) %check if image is in RBG format
   hsv_image = rgb2hsv(A)  % turn image to hsv
   Ahue = A(:,:,1); 
   Asaturation = A(:,:,2);
   Avalue = A(:,:,3);
end

subplot(2,2,1); imshow(A); axis image;%display original image 
subplot(2,2,2); imshow(Ahue); title('hue'); %display hue 
subplot(2,2,3); imshow(Asaturation); title('saturation'); %display saturation
subplot(2,2,4); imshow(Avalue); title('value');%display value


%%
%1.5
%A = imread('D:\master\image processing\examples\onion.png');
A = imread('C:\Users\nicolae\Desktop\dog.jpg');


subplot(2,2,1); imshow(A); axis image;

tic;
nearest = imresize (A,0.01,'nearest');
subplot(2,2,2), imshow(nearest); title('nearest');
toc;

tic;
bilinear = imresize (A,0.01,'bilinear');
subplot(2,2,3), imshow(bilinear); title('bilinear');
toc;

tic;
bicubic = imresize (A,0.01,'bicubic');
subplot(2,2,4), imshow(bicubic); title('bicubic');
toc;


%%
%1.6
A = imread('D:\master\image processing\examples\railway.png');

imtool(A);

%%
%1.7
A = imread('cameraman.tif');
B = imread('rice.png');

subplot(1,3,1),imshow(A);
%figure;
subplot(1,3,2),imshow(B);


C = A-B;
subplot(1,3,3),imshow(C);

figure;

D = imsubtract(A,B);
imagesc(D);

%%
%1.8
names = [
    'D:\master\image processing\examples\AT3_1m4_01.tif'
        'D:\master\image processing\examples\AT3_1m4_02.tif'
        'D:\master\image processing\examples\AT3_1m4_03.tif'
        'D:\master\image processing\examples\AT3_1m4_04.tif'
        'D:\master\image processing\examples\AT3_1m4_05.tif'
        'D:\master\image processing\examples\AT3_1m4_06.tif'
        'D:\master\image processing\examples\AT3_1m4_07.tif'
        'D:\master\image processing\examples\AT3_1m4_08.tif'
        'D:\master\image processing\examples\AT3_1m4_09.tif'
        'D:\master\image processing\examples\AT3_1m4_10.tif'
        ];  %array with paths to images
    
prev = imread(names(1,:));   %store the first image
  
for R = 2 : size(names)
   im= imread(names(R,:));      %read next image
   mosaic = imabsdiff(im,prev); % calculate abs diff
   subplot(3,3,R-1),imshow(mosaic); %display image
   prev = im;                   % store previous image
end

%example 3.6, page 55 from book...XOR

%%
%1.9


A = imread('cameraman.tif');
B = imread('rice.png');


O = blend(A,0.5,B,2.5);

imagesc(O);
%%
names = [
    'D:\master\image processing\examples\AT3_1m4_01.tif'
        'D:\master\image processing\examples\AT3_1m4_02.tif'
        'D:\master\image processing\examples\AT3_1m4_03.tif'
        'D:\master\image processing\examples\AT3_1m4_04.tif'
        'D:\master\image processing\examples\AT3_1m4_05.tif'
        'D:\master\image processing\examples\AT3_1m4_06.tif'
        'D:\master\image processing\examples\AT3_1m4_07.tif'
        'D:\master\image processing\examples\AT3_1m4_08.tif'
        'D:\master\image processing\examples\AT3_1m4_09.tif'
        'D:\master\image processing\examples\AT3_1m4_10.tif'
        ];  %array with paths to images
    
prev = imread(names(1,:));   %store the first image
  
for R = 2 : size(names)
   im= imread(names(R,:));      %read next image
   mosaic = blend(im,1,prev,1); % calculate abs diff
   subplot(3,3,R-1),imshow(mosaic); %display image
   prev = im;                   % store previous image
end


