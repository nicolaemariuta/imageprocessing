I = imread('coins.png');
subplot(1,2,1),imshow(I);
subplot(1,2,2),imhist(I);

%%
I = imread('coins.png');
[count,bins] = imhist(I);
count(60)

%%
I = imread('coins.png');
level = graythresh(I);
It=im2bw(I,level);
imshow(It);
%%
I = imread('rice.png');
Im = imfilter(I,fspecial('average',[15 15]),'replicate');
It = I(Im + 20);

Ibw = im2bw (It,0);

subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(Ibw);

%%
I = imread('pout.tif');
Ics = imadjust(I,stretchlim(I, [0.05, 0.95]),[]);
subplot(2,2,1),imshow(I);
subplot(2,2,2),imshow(Ics);

subplot(2,2,3),imhist(I);
subplot(2,2,4),imhist(Ics);

%%
I = imread('pout.tif');
Ieq = histeq(I);
subplot(2,2,1),imshow(I);
subplot(2,2,2),imshow(Ieq);

subplot(2,2,3),imhist(I);
subplot(2,2,4),imhist(Ieq);

%%
I = imread('pout.tif');
pz=0:255;
Im = histeq(I,pz);

subplot(2,3,1),imshow(I);
subplot(2,3,2),imshow(Im);
subplot(2,3,3),plot(pz);
subplot(2,3,4),imhist(I);
subplot(2,3,5),imhist(Im);

%%
I = imread('pout.tif');
I1=adapthisteq(I,'clipLimit',0.02,'Distribution','rayleigh');
I2=adapthisteq(I,'clipLimit',0.02,'Distribution','exponential');
I3=adapthisteq(I,'clipLimit',0.08,'Distribution','uniform');
subplot(2,2,1),imshow(I);subplot(2,2,2),imshow(I1);
subplot(2,2,3),imshow(I2);subplot(2,2,4),imshow(I3);

%%
I = imread('autumn.tif');
Ihsv = rgb2hsv(I);
V=hiisteq(Ihsv(:,:,3));
subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(Iout);
%%
A = imread('cameraman.tif');
subplot(1,2,1),imshow(A);
func = @(x) max(x(:));
B=nlfilter(A,[3,3],func)
subplot(1,2,2),imshow(B);

%%

A = imread('peppers.png');
subplot(1,2,1),imshow(A);
k = fspecial('motion',50,54);
B = imfilter(A,k,'symmetric');
subplot(1,2,2),imshow(B);

%%
I = imread('eight.tif');
subplot(1,3,1),imshow(I);
Isp=imnoise(I,'salt & pepper',0.03);
subplot(1,3,2),imshow(Isp);
Ig=imnoise(I,'gaussian',0.02);
subplot(1,3,3),imshow(Ig);
figure;
k = ones(3,3)/9;
Im =imfilter(I,k);
Ispm = imfilter(Isp,k);
Igm = imfilter(Ig, k);
subplot(1,3,1),imshow(Im);
subplot(1,3,2),imshow(Ispm);
subplot(1,3,3),imshow(Igm);
figure;
In = medfilt2(I,[3,3]);
Ispn = medfilt2(Isp,[3,3]);
Ign = medfilt2(Ig,[3,3]);
subplot(1,3,1),imshow(In);
subplot(1,3,2),imshow(Ispn);
subplot(1,3,3),imshow(Ign);
figure;
Io = ordfilt2(I,25,ones(5,5));
Ispo = ordfilt2(Isp,25,ones(5,5));
Igo = ordfilt2(Ig,25,ones(5,5));
subplot(1,3,1),imshow(Io);
subplot(1,3,2),imshow(Ispo);
subplot(1,3,3),imshow(Igo);
figure();
k = fspecial('gaussian',[5 5],2);
Ig =imfilter(I,k);
Ispg = imfilter(Isp,k);
Igg = imfilter(Ig, k);
subplot(1,3,1),imshow(Ig);
subplot(1,3,2),imshow(Ispg);
subplot(1,3,3),imshow(Igg);






