function ydata = model(beta0, xdata)
%FUNCTION 此处显示有关此函数的摘要
%   此处显示详细说明
a = beta0(1);
b = beta0(2);
c = beta0(3);
d = beta0(4);
ydata = a+(b-a)./(1+(c*abs(xdata)).^d).^(1-1./d);
end

