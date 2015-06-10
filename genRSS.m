function [ R ] = genRSS( APs, a, b )
%GENH generate realiability matrix R
%   a: stands for x-length
%   b: stands for y-length


R = zeros(10*a+1, 10*b+1);
m = size(APs, 1);
alpha = 0.01;
sigma = 1;
for x = 0:0.1:a
    for y = 0:0.1:b
        Z = zeros(1, m);
        for j = 1:1:m    
            r = ((x - APs(j, 1))^2 + (y - APs(j, 2))^2)^(1/2);
            %p = 1 / (r^2*(sigma^2));
            p = exp(-alpha*r);
            Z(1, j) = p;
        end
        dif = (sum(abs(Z)));
        R(round(10*x + 1), round(10*y + 1)) = dif;
%         figure;
%         plot(real(Z), imag(Z),'.');
        %R(round(10*x + 1), round(10*y + 1)) = (abs(sum(Z)))^2;
%         if R(round(10*x + 1), round(10*y + 1))< 0 
% 
%             x
%             y
%             Z
%             (sum(abs(Z)))^2
%             (abs(sum(Z)))^2
%             (sum(abs(Z)))^2 - (abs(sum(Z)))^2
%         end
    end 
end