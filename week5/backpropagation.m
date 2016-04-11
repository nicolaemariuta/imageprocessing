%%
%backpropagation
I = double(imread('box.png'));
%%
I = zeros(200,200);
I(50,50) = 1;

I = double(imread('box.png'));

subplot(2,2,1);imshow(I);colormap(gray);

step = 10;

R = fradon(I,step);

subplot(2,2,2);imagesc(R);colormap(gray);

Ir = fbackpropagation(R,step);


subplot(2,2,3);imagesc(Ir);colormap(gray);


P = rfiltering(R);
If = fbackpropagation(P,step);
subplot(2,2,4);imagesc(If);colormap(gray);
%%

I = zeros(200,200);
I(50,50) = 1;

step = 1;

R = fradon(I,step);

subplot(1,3,1);imagesc(R);title('[50,100]');colormap(gray);
%
I = zeros(200,200);
I(100,100) = 1;

step = 1;

R = fradon(I,step);

subplot(1,3,2);imagesc(R);title('[100,100]');colormap(gray);
%
I = zeros(200,200);
I(150,150) = 1;

step = 1;

R = fradon(I,step);

subplot(1,3,3);imagesc(R);title('[150,150]');colormap(gray);

%%
I = double(imread('box.png'));

step = 1;

R = fradon(I,step);


R = rfiltering(R);
subplot(2,3,1);imagesc(R);title('box transform');colormap(gray);
Ir = fbackpropagation(R,step);
subplot(2,3,4);imagesc(Ir);colormap(gray);

%
I = zeros(200,200);
I(50,50) = 1;

step = 1;


R = fradon(I,step);



R = rfiltering(R);
subplot(2,3,2);imagesc(R);title('point transform');colormap(gray);
Ir = fbackpropagation(R,step);
subplot(2,3,5);imagesc(Ir);colormap(gray);

%
R = double(imread('sinogram.png'));


R = rfiltering(R);
subplot(2,3,3);imagesc(R);title('sinogram.png');colormap(gray);
Ir = fbackpropagation(R,step);
subplot(2,3,6);imagesc(Ir);colormap(gray);

%%

I = zeros(200,200);
I(50,50) = 1;
I = double(imread('box.png'));

%%
I = double(imread('lena.tiff'));

step = 1;

R = fradon(I,step);

Ir = fbackpropagation(R,step);
subplot(2,4,1);imagesc(Ir);title('step 1');colormap(gray);

step = 5;

R = fradon(I,step);

Ir = fbackpropagation(R,step);
subplot(2,4,2);imagesc(Ir);title('step 5');colormap(gray);

step = 10;

R = fradon(I,step);

Ir = fbackpropagation(R,step);
subplot(2,4,3);imagesc(Ir);title('step 10');colormap(gray);

step = 90;

R = fradon(I,step);

Ir = fbackpropagation(R,step);
subplot(2,4,4);imagesc(Ir);title('step 90');colormap(gray);

%filtered
step = 1;

R = fradon(I,step);
R = rfiltering(R);
Ir = fbackpropagation(R,step);
subplot(2,4,5);imagesc(Ir);title('filtered step 1');colormap(gray);

step = 5;

R = fradon(I,step);
R = rfiltering(R);
Ir = fbackpropagation(R,step);
subplot(2,4,6);imagesc(Ir);title('filtered step 5');colormap(gray);

step = 10;

R = fradon(I,step);

Ir = fbackpropagation(R,step);
subplot(2,4,7);imagesc(Ir);title('filtered step 10');colormap(gray);

step = 90;

R = fradon(I,step);
R = rfiltering(R);
Ir = fbackpropagation(R,step);
subplot(2,4,8);imagesc(Ir);title('filtered step 90');colormap(gray);
