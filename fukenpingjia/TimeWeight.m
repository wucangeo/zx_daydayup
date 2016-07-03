function [ w1,w,H ] = TimeWeight( R )
%TIMEWEIGHT Summary of this function goes here
%   Detailed explanation goes here
PI = 3.1415926; % PI

[m,n] = size(R);    % �����С
w1 = zeros(n,1);     % Ȩ��ϵ��
w = zeros(n,1);   % ʱ��Ȩ��
for i=1:n
    w1(i) = 2*atan(i)/PI;    % Ȩ��ϵ��
end

sumw = sum(w1); % ϵ���ĺ�
for i=1:n
    w(i) = w1(i)/sumw;    % ʱ��Ȩ��
end

H = R*w;


end

