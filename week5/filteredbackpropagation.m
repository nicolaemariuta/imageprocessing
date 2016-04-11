I = zeros(200,200);
I(70,70) = 1;
%%
I = double(imread('box.png'));
subplot(2,2,1);imagesc(I);colormap(gray);
step = 1;
N = size(I,1);
R = zeros(round(180/step),N);



for angle = 1 : (180/step)
    rotate = imrotate(I,(angle-1)*step,'nearest','crop');
    for line = 1 : N 
        sumLine = 0;
        for column = 1 : N
            sumLine = sumLine + rotate(column,line);
        end
        R(angle,line) = sumLine;
    end
end

subplot(2,2,2);imagesc(R);colormap(gray);


%radon inverse transform
P = rfiltering(R);
%backpropagation
[M N] = size(P);

Ir = zeros(N,N);


for a = 1 : M
   Ia = zeros(N,N);
   
   for row = 1 : N
       Ia(row,:) = P(a,:);
   end
   
   Ir = Ir + imrotate(Ia,-(a-1)*step,'nearest','crop');
   
   
end

subplot(2,2,4);imagesc(Ir);colormap(gray);

