function y2 = abcd( a,b,c,d,x1 )
%ABCD �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

[m,n] = size(x1);
y2= zeros(1,n);

for i = 1:n
    y2(i) = a+(b-a)/(1+(c*abs(x1(i)))^d)^(1-1/d);
end

end

