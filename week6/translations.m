%1.1
filter = [1,0,0];
I = imread('lena.tiff');
It = imfilter(I,filter);

subplot(1,2,1);imshow(I);title('lena');
subplot(1,2,2);imshow(It);title('translated lena');

%%
%1.2
x = 101;
y = 101;
sql = 31;
sqw = 31;

I = zeros(x,y);

for r = (x/2)-(sql/2) : (x/2)+(sql/2)
    for c = (y/2)-(sqw/2) : (y/2)+(sqw/2)
        I(r,c) = 1;
    end
end
I = imread('lena.tiff');
It = translate(I,50,-30);


subplot(2,2,3);imshow(It);title('replicate');


%%
%1.3

x = 101;
y = 101;
sql = 31;
sqw = 31;

I = zeros(x,y);


for r = (x/2)-(sql/2) : (x/2)+(sql/2)
    for c = (y/2)-(sqw/2) : (y/2)+(sqw/2)
        I(r,c) = 1;
    end
end



Ifft = abs(fftn(I));
Ishift = fftshift(Ifft);
subplot(1,2,1),imagesc(log(1+Ishift)),title('original image'),colormap(gray);


It = translate(I,-30,30);


Ifft = abs(fftn(It));
Ishift = fftshift(Ifft);
subplot(1,2,2),imagesc(log(1+Ishift)),title('translated image'),colormap(gray);

%%
%1.4

x = 128;
y = 128;
sql = 31;
sqw = 31;

I = zeros(x,y);

for r = (x/2)-(sql/2) : (x/2)+(sql/2)
    for c = (y/2)-(sqw/2) : (y/2)+(sqw/2)
        I(round(r),round(c)) = 1;
    end
end
I = imread('lena.tiff');
Ifft = fftn(I);
Ifftr = zeros(size(Ifft));
Ifft = fftshift(Ifft);

a = -50;
b = 50;

for kx = 1 : size(Ifft,1)
    for ky = 1 : size(Ifft,2)
        Ifftr(kx,ky) = (exp(-1i*((kx-1-size(Ifft,1)/2)*(2*pi/size(Ifft,1))*a+(ky-1-size(Ifft,2)/2)*b*(2*pi/size(Ifft,1)))))*Ifft(kx,ky);
    end
end

Ifftr = fftshift(Ifftr);
It = abs(ifft2(Ifftr));

subplot(1,2,1);imagesc(I);title('original image');
subplot(1,2,2);imagesc(It);title('translated image');colormap(gray);


%%
%1.5
I1 = imread('westconcordaerial.png'); 
I2 = imread('westconcordorthophoto.png');

subplot(2,2,1);imagesc(I1);title('westconcordaerial.png');colormap(gray);
subplot(2,2,2);imagesc(I2);title('westconcordorthophoto.png');colormap(gray);

%cpselect(I1,I2);

movingPoints = [129.7500,92.7500;318.7500 ,81.2500];
fixedPoints = [173.7500, 104.7500; 348.7500, 131.7500];


transf = fitgeotrans(movingPoints,fixedPoints, 'nonreflectivesimilarity' );


%calcualte parameters
u = [0 1]; 
v = [0 0]; 
[x, y] = transformPointsForward(transf, u, v); 
dx = x(2) - x(1); 
dy = y(2) - y(1); 
angle = (180/pi) * atan2(dy, dx); 
scale = 1 / sqrt(dx^2 + dy^2);

alfa = scale*cos(angle);
beta = scale*cos(angle);
l1 = scale*(dx*cos(angle) + dy*sin(angle));
l2 = scale*(-dx*sin(angle) + dy*cos(angle));

T = [alfa, beta, l1; -beta, alfa, l2; 0, 0, 1];


I1t = imwarp(I1,transf);
subplot(2,2,3);imagesc(I1t);title('transformed');colormap(gray);

 
%%
figure;
x = [0,1,1,0,0];
y = [0,0,1,1,0];
x1 = [0.6,1.3,1,0.4,0.6];
y1 = [0.6,0.8,1.6,1,0.6];

I1 = [0,0;1,0;1,1;0,1;0,0];
I2 = [0.6,0.6; 1.3,0.8; 1,1.6; 0.4,1;0.6,0.6];




plot(I1(:,1),I1(:,2),I2(:,1),I2(:,2));
hold on; 

transf = fitgeotrans(I1,I2,'projective');
I1(:,3) = 1;


I1t = I1*(transf.T);

I1t(:,1) = I1t(:,1)./I1t(:,3);
I1t(:,2) = I1t(:,2)./I1t(:,3);

 plot(I1t(:,1),I1t(:,2),'r--');
 
 axis image;