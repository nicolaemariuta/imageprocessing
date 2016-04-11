function B2 = scale( B,G, m, n )

[x, y]=meshgrid(round(-G/2):round(G/2), round(-G/2):round(G/2));
f=exp(-x.^2/(2*m^2)-y.^2/(2*n^2));
f=f./sum(f(:));

B2 = imfilter(B,f,'same','conv');

end

