function P= rfiltering( R )
p = double(R);
P = zeros(size(p));

ramp = fftshift(-size(P,2)/2:size(P,2)/2-1);

for r = 1 : size(R,1)
    P(r,:) = fft(p(r,:));
    P(r,:) = real(ifft(abs(ramp).*P(r,:)));
end

end

