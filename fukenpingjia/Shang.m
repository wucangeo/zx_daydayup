function [M,R,D,E] = Shang( RM, EM )
%SHANG Summary of this function goes here
%   Detailed explanation goes here
% RealM 实际进度
% ExpM 预期进度

M = RM-EM;
[m,n]=size(M);

% 矩阵标准化
% http://blog.csdn.net/yb536/article/details/41050181
A = ones(m,n);
R = (M+A);


% 熵的计算
% Dij分布计算
k = log(n);
E = zeros(m,1);
D = zeros(m,n);
for i=1:m
    for j = 1:n
        D(i,j)=R(i,j) / sum(R(i,:));
    end
end
%计算熵
for i=1:m
    sumR = 0;
    for j = 1:n
        sumR = sumR +R(i,j)*log(R(i,j));
    end
    E(i) = -k*sumR;
end

end


