function canshu = main()
%MAIN 此处显示有关此函数的摘要
%   此处显示详细说明

path = 'C:\Users\wucan\Desktop\zx\MATLAB\SWCC.xlsx';
sheetname = 'Sheet2';    % excel 中数据所在的sheet名称

[data]=xlsread(path,sheetname,'C2:O13');
[m,n] = size(data);

beta0 = [ 0.09 , 0.09 , 0.01 , 1] ;
xdata = [0, 0.0300, 0.1000, 0.2000, 0.4000, 0.6000, 0.8000, 1.0000, 2.0000, 4.0000, 6.0000, 8.0000, 10.0000];
x1 = 0:0.05:15;
[xm,xn] = size(x1);
y2 = zeros(m,xn);
canshu= zeros(m,4);
for i = 1:m
    ydata = data(i,:);
    [betafit,r,J] = nlinfit(xdata,ydata,'model',beta0);
%     y2(i,:)= abcd(betafit(1),betafit(2),betafit(3),betafit(4),x1); 
%     [j,k]=size(r)
    canshu(i,:) = betafit;
end


% plot(x1,y2,'k-',xdata,data,'ko');


% reslut =betafit;
end