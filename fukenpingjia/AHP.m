function [W,E,a,b] = AHP(R)
%AHP Summary of this function goes here
%   Detailed explanation goes here

n = 4;  % ����

r1=R(1,1)*R(1,2)*R(1,3)*R(1,4);
r2=R(2,1)*R(2,2)*R(2,3)*R(2,4);
r3=R(3,1)*R(3,2)*R(3,3)*R(3,4);
r4=R(4,1)*R(4,2)*R(4,3)*R(4,4);

M = [r1,r2,r3,r4];  % ���г˻�

wi=[sqrt(M(1)),sqrt(M(2)),sqrt(M(3)),sqrt(M(4))]; % �󷽸�

% ��һ��
we = wi(1)+wi(2)+wi(3)+wi(4);
W = [wi(1)/we;wi(2)/we;wi(3)/we;wi(4)/we];  % ָ��Ȩ��

BW = R*W;  
E = (BW(1)/W(1)+BW(2)/W(2)+BW(3)/W(3)+BW(4)/W(4))/n;     % �������ֵ

[a,b] = eig(R);     % matlab�Դ������������������ֵ



end

