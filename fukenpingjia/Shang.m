function [M,R,D,E] = Shang( RM, EM )
%SHANG Summary of this function goes here
%   Detailed explanation goes here
% RealM ʵ�ʽ���
% ExpM Ԥ�ڽ���

M = RM-EM;
[m,n]=size(M);

% �����׼��
% http://blog.csdn.net/yb536/article/details/41050181
A = ones(m,n);
R = (M+A);


% �صļ���
% Dij�ֲ�����
k = log(n);
E = zeros(m,1);
D = zeros(m,n);
for i=1:m
    for j = 1:n
        D(i,j)=R(i,j) / sum(R(i,:));
    end
end
%������
for i=1:m
    sumR = 0;
    for j = 1:n
        sumR = sumR +R(i,j)*log(R(i,j));
    end
    E(i) = -k*sumR;
end

end


