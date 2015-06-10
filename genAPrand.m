function [ APs ] = genAPrand( a, b, m )
%GENAP generate AP locations APs
%   a: stands for x-length
%   b: stands for y-length
%   m: stands for the number of APs

APs = zeros(m, 2);

for i = 1:1:m
    APs(i, 1) = roundn(rand*a, -1);
    APs(i, 2) = roundn(rand*b, -1);
end

