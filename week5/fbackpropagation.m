function Ir = fbackpropagation(R,step)
[M N] = size(R);
Ir = zeros(N,N);

for a = 1 : M
   Ia = zeros(N,N);
   for row = 1 : N
       Ia(row,:) = R(a,:);
   end
    Ir = Ir + imrotate(Ia,-(a-1)*step,'nearest','crop');
end

end

