function R = fradon(I,step)
N = size(I,1);
M = 180;

R = zeros(round(M/step),N);


for angle = 1 : ((180/step)+1)
    rotate = imrotate(I,(angle-1)*step,'nearest','crop');
    for line = 1 : N 
        sumLine = 0;
        for column = 1 : N
            sumLine = sumLine + rotate(column,line);
        end
        R(angle,line) = sumLine;
    end
end

end

