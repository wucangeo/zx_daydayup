function r = modeltest()
%MODELTEST 此处显示有关此函数的摘要
%   此处显示详细说明
% beta =[ 0.1 , 0.1 , 0.01 , 1] ;
% xdata =[ 0, 50.65, 293.77, 790.14, 992.74, 5065, 10130, 15195];
% ydata =[ 0.5650, 0.4013, 0.2502, 0.2324,0.2307, 0.1926, 0.1812, 0.1730] ;
% [betafit, r, J] =nlinfit (xdata , ydata , 'model',beta);
% x = 0:15195;
% y = abcd(betafit(1),betafit(2),betafit(3),betafit(4),x);
% plot(x,y,'ko');

beta1 =[ 0.1 , 0.1 , 0.01 , 1] ;
xdata1 = [0, 0.03, 0.1, 0.2, 0.4, 0.6, 0.8, 1, 2, 4, 6, 8, 10];
ydata1 = [0.305 , 0.294 , 0.215 , 0.157 , 0.123 , 0.106 , 0.097 , 0.090 , 0.080 , 0.071 , 0.065 , 0.061 , 0.059];
[betafit1, r1, J1] =nlinfit (xdata1 , ydata1 , 'model',beta1);
x1 = 0:0.05:10;
y1 = abcd(betafit1(1),betafit1(2),betafit1(3),betafit1(4),x1);
plot(x1,y1,'ko');

r='a';


end

