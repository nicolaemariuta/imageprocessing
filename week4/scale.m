function Is = scale(I,s,dr,dc)

rows = size(I,1);
cols = size(I,2);

G = zeros(rows,cols);

G(1:rows/2+1, 1:cols/2+1) = exp(-(repmat(([0:rows/2]'/rows).^2,[1,cols/2+1])+repmat(([0:cols/2]/cols).^2,[rows/2+1,1]))*(s*2*pi)^2/2);
G(rows/2+1:rows, 1:cols/2+1) = flipud(G(2:rows/2+1, 1:cols/2+1));
G(1:rows/2+1, cols/2+1:cols) = fliplr(G(1:rows/2+1, 2:cols/2+1));
G(rows/2+1:rows, cols/2+1:cols) = fliplr(flipud(G(2:rows/2+1, 2:cols/2+1)));

% Calculate the Differentiation matrix
j = sqrt(-1);
x = [0:rows/2-1,-rows/2:-1]/rows;
y = [0:cols/2-1,-cols/2:-1]/cols;
DG = (x.^dr)'*(y.^dc)*(j*2*pi)^(dr+dc);

Is = I.*G.*DG;
