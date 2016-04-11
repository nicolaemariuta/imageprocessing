I = zeros(200,200);
I(50,50) = 1;
subplot(2,2,1);imshow(I);colormap(gray);

N = size(I,1);
M = 180;

R = zeros(M,N);

for angle = 1 : 180
    rotate = imrotate(I,angle-1,'nearest','crop');
    for line = 1 : N 
        sumLine = 0;
        for column = 1 : N
            sumLine = sumLine + rotate(column,line);
        end
        R(angle,line) = sumLine;
    end
end


subplot(2,2,2);imshow(R);colormap(gray);


%radon inverse transform
p = double(R);
P = zeros(size(p));

for r = 1 : size(R,1)
    P(r,:) = fft(p(r,:));
end


subplot(2,2,3);imshow(abs(P));colormap(gray);

F = zeros(size(P));

for v = 1 : size(P,1)
    for r = 1 : size(P,2)
        phi = (pi/180)*(r-1);
        F(max(1,round(v*cos(phi))),max(1,round(v*sin(phi)))) = P(v,r);
    end
end

F = fftshift(F);

ramp = zeros(size(F));
for r = 1 : size(F,1)
    for c = 1 : size(F,2)
        ramp(r,c) = c;
    end
end



subplot(2,2,4);imagesc(ramp);colormap(gray);

%%
Im = ifft2(F);
subplot(2,2,4);imshow(real(Im));colormap(gray);

%%
I = double(imread('box.png'));
subplot(2,2,1);imagesc(I);colormap(gray);

N = size(I,1);
M = 180;

R = zeros(M,N);

for angle = 1 : 180
    rotate = imrotate(I,angle-1,'nearest','crop');
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
rfft = double(R);
Rfft = fft(rfft,[],2);


subplot(2,2,3);imshow(real(Rfft));colormap(gray);

F = zeros(size(Rfft));

for v = 1 : size(Rfft,1)
    for phi = 1 : size(Rfft,2)
        F(1+uint16(v*cos(phi)),1+uint16(v*sin(phi))) = Rfft(v,phi);
    end
end

Im = ifft2(F);
subplot(2,2,4);imshow(real(Im));colormap(gray);


%%
%backpropagation
I = double(imread('box.png'));
subplot(2,2,1);imagesc(I);colormap(gray);

N = size(I,1);
M = 180;

R = zeros(M,N);

for angle = 1 : 180
    rotate = imrotate(I,angle-1,'nearest','crop');
    for line = 1 : N 
        sumLine = 0;
        for column = 1 : N
            sumLine = sumLine + rotate(column,line);
        end
        R(angle,line) = sumLine;
    end
end


subplot(2,2,2);imagesc(R);colormap(gray);

Ir = zeros(size(I));


for x = 1 : size(I,1)
    for y = 1 : size (I,2)
        xn = y - size(I,1)/2;
        yn = size(I,2)/2- x;
       
        sum = 0;
        for a = 1 : M
            phi = pi*x/180;
            c = round(xn*cos(phi)+yn*sin(phi));
            sum = sum+ R(c,phi);
            
        end
         
        Ir(x,y) = sum;
    end
end


subplot(2,2,2);imshow(Ir);colormap(gray);
