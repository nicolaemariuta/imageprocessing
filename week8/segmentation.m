%4 sobel
I = imread('concordaerial.png'); 
I = rgb2gray(I);
J = imnoise(I, 'salt & pepper', 0.05);

Jf = medfilt2(J,[8,8]);

k = fspecial('gaussian',[150,150],50);
Jfg = imfilter(J,k);

BW = edge(Jfg,'sobel');

imshow(BW);title('noise 0.01')
axis image;
%%
%4 log
I = imread('concordaerial.png'); 
I = rgb2gray(I);
J = imnoise(I, 'salt & pepper', 0.01);

Jf = medfilt2(J,[100,100]);

k = fspecial('gaussian',[15,15],5);
Jfg = imfilter(J,k);

BW = edge(Jfg,'log');

imshow(BW);

%%
%4 canny
I = imread('concordaerial.png'); 
I = rgb2gray(I);
J = imnoise(I, 'salt & pepper', 0.05);

Jf = medfilt2(J,[10,10]);

k = fspecial('gaussian',[5,5],4);
Jfg = imfilter(J,k);

BW = edge(Jfg,'canny');

imshow(BW);

%%
%5 snake
alpha = 100;
beta = 17;
gamma = 300;
sigma = 2;
N = 200;

[Im,map] = imread('canoe.tif');
Irgb = ind2rgb(Im,map);

I1 = Irgb(:,:,1);
I2 = Irgb(:,:,2);

I = abs(I2-I1);


k = fspecial('gaussian',[sigma*2,sigma*2],sigma);
Is = imfilter(I,k,'conv');
[Isc,Isr] = gradient(Is);
G = 200000*sigma^2*(Isc.^2+Isr.^2);

% Make an initial curve
t = linspace(0,2*pi,N)';
t = t(1:end-1);
x = [size(I,1)/2+size(I,1)*5/16*cos(t), size(I,2)/2+size(I,2)*5/16*sin(t)];


% Setup the figure
f = figure(1);
clf
subplot(1,2,1)
imagesc(Irgb);
colormap(gray);
title('Original');
subplot(1,2,2)
imagesc(G);
colormap(gray);
title('Image Energy');
set(f,'DoubleBuffer','on')
h1 = -1;
h2 = -1;
for t = 1:3000
  x = snake(x,alpha,beta,G,gamma,15);
  
  if h1 > -1
    delete(h1);
  end
  if h2 > -1
    delete(h2);
  end
  subplot(1,2,1);
  hold on;
  h1 = plot([x(:,2);x(1,2)],[x(:,1);x(1,1)],'linewidth',sigma);
  hold off;
  subplot(1,2,2);
  hold on;
  h2 = plot([x(:,2);x(1,2)],[x(:,1);x(1,1)],'linewidth',sigma);
  hold off;
  drawnow;
end












