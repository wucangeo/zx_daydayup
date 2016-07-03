function [ w1,w,H ] = TimeWeight( R )
%TIMEWEIGHT Summary of this function goes here
%   Detailed explanation goes here
PI = 3.1415926; % PI

[m,n] = size(R);    % 矩阵大小
w1 = zeros(n,1);     % 权重系数
w = zeros(n,1);   % 时间权重
for i=1:n
    w1(i) = 2*atan(i)/PI;    % 权重系数
end

sumw = sum(w1); % 系数的和
for i=1:n
    w(i) = w1(i)/sumw;    % 时间权重
end

H = R*w;


end

