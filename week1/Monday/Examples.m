%Example1.1%
imfinfo('cameraman.tif');
A=imread('cameraman.tif');
imwrite(A,'cameraman.jpg','jpg');
imfinfo('cameraman.jpg');
%%
%Example 1.2
A=imread('cameraman.tif');
imshow(A);
%figure();
imagesc(A);
axis image;
%axis off;
colormap(gray);
%%
%Example 1.3
B = rand(256).*1000;
imshow(B);
%figure;
imagesc(B);
axis image;axis off;
colormap(gray);colorbar;
%figure;
imshow(B,[0 1000]);
%%
%Example 1.4
B = imread('cell.tif');
C = imread('spine.tif');
D = imread('D:\master\image processing\examples\onion.png');

subplot(3,1,1);imagesc(B);axis image;
axis off;colormap(gray);

subplot(3,1,2);imagesc(C);
axis off;colormap(jet);

subplot(3,1,3);imshow(D);

%%
%Example 1.5
B = imread('cell.tif');
imtool(B);

D = imread('D:\master\image processing\examples\onion.png');
imtool(D);

B(25,50);
B(25,50) = 255;
imshow(B);

figure;
D(25,50,:);
D(25,50,1);
D(25,50,:) = [255,255,255];
imshow(D);

%%
%Example 1.6
D = imread('D:\master\image processing\examples\onion.png');
Dgray = rgb2gray(D);

subplot(2,1,1); imshow(D); axis image; 
subplot(2,1,2);imshow(Dgray);

%%
%Example 1.7
D = imread('D:\master\image processing\examples\onion.png');
Dred = D(:,:,1);
Dgreen = D(:,:,2);
Dblue = D(:,:,3);

figure;
subplot(2,2,1),imshow(D),axis image;
subplot(2,2,2),imshow(Dred),title('red');
subplot(2,2,3),imshow(Dgreen),title('green');
subplot(2,2,4),imshow(Dblue),title('blue');

%%
%Exercise 1.1
D = imread('cell.tif');
subplot(2,2,1),imshow(D),axis image;
D(100,20) = D(100,20) + 25;
subplot(2,2,2),imshow(D),axis image;

%%
%Exercise 1.2

D = imread('D:\master\image processing\examples\onion.png');
subplot(2,2,1),imshow(D),axis image;

for R = 1: size(D,1)
    for C = 1: size(D,2)
        pixel1 = D(R,C,1);
        pixel1 = pixel1+55;
        D(R,C,1) = pixel1;
        
        pixel2 = D(R,C,2);
        pixel2 = pixel2+55;
        D(R,C,2) = pixel2;
        
        pixel3 = D(R,C,3);
        pixel3 = pixel3+55;
        D(R,C,3) = pixel3;
    end
end   
  
subplot(2,2,2),imshow(D),axis image;

D = imread('cell.tif');
subplot(2,2,3),imshow(D),axis image;

for R = 1: size(D,1)
    for C = 1: size(D,2)
        pixel = D(R,C);
        pixel = pixel+25;
        D(R,C) = pixel;
    end
end   
  
subplot(2,2,4),imshow(D),axis image;

%%
%Exercise 1.3
D = imread('cell.tif');
imshow(D);
axis off;
colormap(lines);

%%
%Exercise 1.4

imfinfo('cameraman.tif');
A=imread('cameraman.tif');
imwrite(A,'D:\master\image processing\week1\Monday\cameraman.jpg','jpg');
imwrite(A,'D:\master\image processing\week1\Monday\cameraman.png','png');

B = imread('D:\master\image processing\week1\Monday\cameraman.jpg');
C = imread('D:\master\image processing\week1\Monday\cameraman.png');

subplot(2,2,1),imshow(B);
subplot(2,2,2);imshow(C);

A = imabsdiff(B,C);
subplot(2,2,3);imagesc(A);

%%
%Example 2.1
f = ones(64,1); f = f./sum(f); 
g = conv(f,f); g = g./sum(g);
h = conv(g,g); h = h./sum(h);
j = conv(h,h); j = j./sum(j);

subplot(2,2,1),plot(f,'k-'); axis square; axis off; 
subplot(2,2,2),plot(g,'k-'); axis square; axis off; 
subplot(2,2,3),plot(h,'k-'); axis square; axis off; 
subplot(2,2,4),plot(j,'k-'); axis square; axis off;

%%
%Example 2.2
A = imread('D:\master\image processing\examples\trui.png');
PSF = fspecial('gaussian',[5 5],2); 
h = fspecial('motion',10,45);
B = conv2(PSF,double(A));
C = imfilter(A,h,'replicate');
D = conv2(double(A),double(A));
subplot(2,2,1),imshow(A);
subplot(2,2,2),imshow(B,[]);
subplot(2,2,3),imshow(C,[]);
subplot(2,2,4),imshow(D,[]);

%%
%Example 2.3
A = imread('cameraman.tif');
[rows dims] = size(A);
Abuild = zeros(size(A));
% Randomly sample 1% of points only and convolve with gaussian PSF 
sub = rand(rows.*dims,1)<0.01;
Abuild(sub)=A(sub);
h=fspecial('gaussian',[10,10],2);
B10=filter2(h,Abuild);
subplot(1,2,1),imagesc(Abuild);
axis image; axis off; colormap(gray);title('Object points');
subplot(1,2,2), imagesc(B10);
axis image; axis off; colormap(gray);title('Response to LSI system');

%%
%Example 3.1
A=imread('cameraman.tif'); % Read in image 
subplot(1,2,1), imshow(A); % Display image 
B = imadd(A, 100); % Add 100 pixel values to image A 
subplot(1,2,2), imshow(B); % Display result image B 
%%
%Example 3.2
A=imread('D:\master\image processing\examples\cola1.png'); % Read in 1st image 
B=imread('D:\master\image processing\examples\cola2.png'); % Read in 2nd image 
subplot(2,3,1), imshow(A); % Display 1st image 
subplot(2,3,2), imshow(B); % Display 2nd image 
Output = imsubtract(A, B); % subtract images 
subplot(1,3,3), imshow(Output); % Display result 

%Example 3.3
Output = imabsdiff(A, B); % subtract images 
subplot(2,3,4), imshow(Output); % Display result 

%Example 3.4
Output = immultiply(A,1.5); % multiple image by 1.5 
subplot(2,3,5), imshow(Output); % Display result 
Output = imdivide(A,4); % divide image by 4 
subplot(2,3,6), imshow(Output); % Display result 

%%
%Example 3.5
A=imread('cameraman.tif'); % read in image 
subplot(1,2,1), imshow(A); % display image 
B = imcomplement(A); % invert the image 
subplot(1,2,2), imshow(B); % display result image B 
%%
%Example 3.6
A=imread('D:\master\image processing\examples\toycars1.png'); % Read in 1st image 
B=imread('D:\master\image processing\examples\toycars2.png'); % Read in 2nd image 
subplot(2,3,1), imshow(A); 
subplot(2,3,2), imshow(B); 
subplot(2,3,3), imshow(imabsdiff(A, B)); 
Abw=im2bw(A); % Automatically convert to binary 
Bbw=im2bw(B); % Automatically convert to binary 
subplot(2,3,4), imshow(Abw); 
subplot(2,3,5), imshow(Bbw); 
Output = xor(Abw, Bbw); % Perform XOR of images 
subplot(2,3,6), imshow(Output); % Display result 
%%
%Example 3.7
I=imread('D:\master\image processing\examples\trees.tif'); % Read in 1st image 
T=im2bw(I, 0.1); % perform thresholding 
subplot(1,2,1), imshow(I); % Display original image 
subplot(1,2,2), imshow(T); % Display thresholded image 

%Example 3.8
I=imread('cameraman.tif'); % Read in image 
subplot(2,2,1), imshow(I); % Display image 
Id=im2double(I); 
Output1=2*log(1+Id); 
Output2=3*log(1+Id); 
Output3=5*log(1+Id); 
subplot(2,2,2), imshow(Output1); % Display result images 
subplot(2,2,3), imshow(Output2); 
subplot(2,2,4), imshow(Output3); 
%%
%Example 3.9
I=imread('cameraman.tif'); % Read in image 
subplot(2,2,1), imshow(I); % Display image Id=im2double(I); 
Output1=4*(((1+0.3).^(Id)) - 1); 
Output2=4*(((1+0.4).^(Id)) - 1); 
Output3=4*(((1+0.6).^(Id)) - 1); 
subplot(2,2,2), imshow(Output1); % Display result images 
subplot(2,2,3), imshow(Output2); 
subplot(2,2,4), imshow(Output3); 
%%
%Example 3.10
I=imread('cameraman.tif'); % Read in image 
subplot(2,2,1), imshow(I); % Display image 
Id=im2double(I); 
Output1=2*(Id.^0.5); 
Output2=2*(Id.^1.5); 
Output3=2*(Id.^3.0); 
subplot(2,2,2), imshow(Output1); % Display result images 
subplot(2,2,3), imshow(Output2); 
subplot(2,2,4), imshow(Output3); 
%%
%Example 3.11
A=imread('cameraman.tif'); % Read in image 
subplot(1,2,1), imshow(A); % Display image 
% Map input grey values of image A in range 0-1 to an 
% output range of 0-1 with gamma factor of 1/3 (i.e. r = 3). 
B=imadjust(A,[0 1],[0 1],1./3); 
subplot(1,2,2), imshow(B); % Display result.

%%



