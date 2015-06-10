function [ ] = plotZ( Z )
%PLOTZ 此处显示有关此函数的摘要
%   plot Z in a figure
n = size(Z, 2);
figure;
title('Z in the vector form');
for i = 1:1:n
    line([0 0], [real(Z(i)), imag(Z(i))]);
    [real(Z(i)), imag(Z(i))]
    hold on;
end

end

