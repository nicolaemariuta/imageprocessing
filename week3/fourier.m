%b
x =[-5:0.1:5];


plot(x,1/5);title('box');xlabel('x');ylabel('y'); 

%%
%sinc 
w = 10;
h = 500;
x =[-w:0.1:w];
x = x/h;
plot(x,(1/(2*pi))*sinc(x));title('sinc');xlabel('x');ylabel('y'); 


%%
%2.1 Power spectrum
B = imread('D:\master\image processing\week3\lena.tiff');
subplot(1,2,1),imshow(B),title('lena');

NP = abs(fftn(B));
NPshift = fftshift(NP);
subplot(1,2,2),imagesc(log(1+NPshift)),title('power spectrum');

%%
%2.2 
B = imread('D:\master\image processing\week3\lena.tiff');
subplot(2,2,1),imshow(B),title('lena');


size = 9;

tic
for j = 1 : 1
    kernel = zeros([size,size]);
    B2 = filter(B,kernel);
end
toc;


%%
subplot(2,2,2),imagesc(B2),title('B*kernel');

Bfft = fft2(B);
subplot(2,2,3),imshow(Bfft),title('B frequency domain');

kernelfft = fft2(kernel);
kernelfft2 = zeros(Rimage,Cimage);
xpos = 1; ypos = 1;
kernelfft2(xpos:xpos+r-1,ypos:ypos+c-1) = kernel;
kernelfft2 = fft2(kernelfft2);


subplot(2,2,4),imshow(kernelfft2);
K = Bfft.*kernelfft2;
subplot(2,2,4),imagesc(real(ifft2(K))),colormap(gray),title('inverse fft for B(x)kernel(x)');


%%
%2.3
B = imread('D:\master\image processing\week3\lena.tiff');
subplot(2,2,1),imshow(B),title('lena');

F = zeros(size(B));

a = 20;
v = 1;
w = 5;

for x = 1: size(F,1)
    for y = 1: size(F,2)
        F(x,y) = a*cos(v*x + w*y);
        B(x,y) = B(x,y) + F(x,y);
    end
end

subplot(2,2,2),imshow(B),title('lena+function');

Bfft = fft2(B);

NP = abs(Bfft);
NPshift = fftshift(NP);
subplot(2,2,3),imagesc(log(1+NPshift)),title('power spectrum');



Ffft = fft2(F);
Bfft = Bfft-Ffft;

NP = abs(Ffft);
NPshift = fftshift(NP);
figure;
imagesc(real(ifft2(Bfft))),title('restored image'),colormap(gray);

%%
%2.4
B = imread('D:\master\image processing\week3\lena.tiff');
subplot(1,2,1),imshow(B),title('lena');



Bf = scale(B,[3 2],1,1);
subplot(1,2,2),imshow(Bf),title('lena');

%%
%2.5
B = imread('D:\master\image processing\week3\lena.tiff');
subplot(1,2,1),imshow(B),title('lena');

%calculate derivative using the gaussian filter
m = 3;
n = 2;
devm = 1;
devn = 1;
Bf = scale(B,[m n],devm,devn);

%calculate fourier transform of the image
Bfft = fft2(B);

NP = abs(Bfft);
NPshift = fftshift(NP);
subplot(1,2,2),imagesc(log(1+NPshift)),title('power spectrum');

%calcualte gaussian kernel
G = [m n];

[m, n]=meshgrid(round(-G/2):round(G/2), round(-G/2):round(G/2));
kernel=exp(-m.^2/(2*devm^2)-n.^2/(2*devn^2));
kernel=kernel./sum(kernel(:));

%fourier transform of the kernel
kernelfft2 = zeros(size(B));
xpos = 1; ypos = 1;
kernelfft2(xpos:xpos+r-1,ypos:ypos+c-1) = kernel;
kernelfft2 = fft2(kernelfft2);

%multiply kernel with transform of the image
K = Bfft.*kernelfft2;
subplot(2,2,4),imagesc(real(ifft2(K))),colormap(gray),title('derivative using fft');


%%
%2.6

