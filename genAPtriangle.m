function [ APs ] = genAP( a, b, m )
%GENAP generate AP locations APs
%   a: stands for x-length
%   b: stands for y-length
%   m: stands for the number of APs

APs = zeros(m, 2);
n = round(m^(1/2));
for i = 1:1:m
    APs(i, 1) = rem(i,n) * (a/n) + rem(round(i/n),2) *  (a/n/2) ;
    APs(i, 2) = rem( round(i/n) * (a/n) * (3^(1/2)/2) + (a/n/2) * (3^(1/2)/2), b);
end