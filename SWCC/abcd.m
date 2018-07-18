function y2 = abcd( a,b,c,d,x1 )
%ABCD 此处显示有关此函数的摘要
%   此处显示详细说明

[m,n] = size(x1);
y2= zeros(1,n);

for i = 1:n
    y2(i) = a+(b-a)/(1+(c*abs(x1(i)))^d)^(1-1/d);
end

end

