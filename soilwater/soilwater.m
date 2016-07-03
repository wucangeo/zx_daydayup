function [ output_args ] = soilwater( )
%SOILWATER Summary of this function goes here
%   Detailed explanation goes here
% clc,clear;      //清空屏幕函数
% function multifractal(A)
format long g
%输入一个列向量即可
DApath=['E:\MATLAB\fenxing code\geardata\zhengchang\'];     % 指定文件夹工作路径
% zc=[];
for I=1:2   % 一共两个文件
    DATAfile=['Data1-' int2str(I) '.txt'];      % 利用序号I指定文件名称
    % [DATAfile DApath]=uigetfile('*.txt','输入信号');
    FILENAME=[DApath,DATAfile];     % 拼接文件夹路径与文件名
    data=load(FILENAME);            % 加载数据 data
    data=data(1:4096,1);    % 取第一列
    A=data;     %指定A为这一列
    %format long g
    L=length(A);    % 取A的长度
    i=1;            % 指定i=1
    modify=1;       % 指定 modify = 1
    tmin=2;     % 边框间距，“※”
    tmax=10;
    ttmin=-10;
    ttmax=10;% 自定义 q 的范围
    for r=tmin:1:tmax   %从tmin开始，间距为1，取到tmax
        c(i,1)=mod(L,r);    % 对L取r的余数，保存到数组c的第一列
        i=i+1;
    end
    c'; % 计算不能被边长r整除的余数,cc：将数组c转置，但未保存？
    a=L-c';% 计算并剔除掉不能被边长r整除的原始数据，得到有用数据的个数
    n=length(a);  % 求解格网化边长的个数，即为 n（网格边长可以有n=9种）
    TT=[];
    j=1;
    r=tmin;   % 自定义项
    for i=1:1:n   % 即n=25-10+1，自定义的结果
        B=A(1:a(i),1);
        U=reshape(B,r,length(B)/r);%不明白？？？？？？？
        T=mean(U);%默认的是求各列的均值
        T=T'.*r^3;
        TT(1: length(T),i)=[T]; %概率密度分布函数
        modifying(modify,1)=length(T);
        r=r+1;
        if r>= tmin+n           % 自定义项
            break;       % 边长超过10+n，超过初始限制，则程序自动终止
        end
        modify=modify+1;
    end
    modifying;
    % TT= nthroot(TT,1); %对TT开n次方根 开一次方根有意义吗？？？？
    % 或者不缩小
    % TT;
    %TT=nonzeros(TT); %矩阵TT中的非零元素
    for cugb=1:1:n   %cugb=9
        modifying_modifying(cugb,1)=sum(modifying(1:cugb));     % 有影响的新加卷 % & * % ￥ # @ ！） ……
    end
    modifying_modifying;
    j=1;
    % q 为任意数，这里取1到n，为n，与 k取值保持一致，q过大，计算机无法识别，默认为无穷大，q过小，结果接近0，则意义不明确
    for q=ttmin:ttmax           %这里取 q=-10:1:10
        for k=1:1:n
            X=TT(1:modifying_modifying(k,1),1).^q;
            if k>1
                X=TT(modifying_modifying(k-1,1)+1:modifying_modifying(k,1),1).^q;
            end
            t=sum(X);
            XX(k,j)=[t];             % 这里用到两个循环，即考虑到了幂函数，又需考虑求和
        end
        j=j+1;
    end
    XX;                     % 得到质量分配函数
    X=log(tmin:1:tmax);
    %
    % X=log(tmax:-1:tmin);          % 此系以前的自定义输入结果，“※—4”
    %
    Y=log(XX);
    %
    % figure(1)
    % plot(X',Y,'o-k')        % 至此，计算多重分形谱的第一步，分配函数构建完毕
    %
    %求质量指数τ(q)
    side_length= tmin:1:tmax;         % 自定义网格边长，“※—5”
    side_length=side_length';
    q=ttmin:ttmax;                    % q=-5:1:n-10，q=-10:1:10
    m=1;
    [ha,hb]=size(XX);
    for i=1:1:hb
        % XX=XX’;                         % or not
        s=XX(:,i);                        % XX
        b=polyfit(log(side_length),log(s),1);  % 在对数尺度下计算斜率
        slope(m,1)=b(1,1);
        m=m+1;
    end
    slope;   %  这里的Slope即为质量指数，τ(q)
    N=polyfit(q', slope,1);
    plot(q', slope)    %  此步是考察τ(q)-q 之间的关系，
    %
    %求奇异指数
    a=diff(slope)./diff(q');   % 第三步计算，diff函数求偏导确实少一列
    %
    %求多重分形谱
    q=q';
    f_a=a.*q(1:end-1)-slope(1:end-1);%多重分形谱
    %
    % figure(2)
    % a=sort(a,'ascend');
    plot(a,f_a,'o-k')
    %xlabel('α','FontSize',12);
    %ylabel('f(α)','FontSize',12);
    % polyfit(a,f_a,3)
    a=sort(a,'ascend');
    % a+1
    % f_a+1
    a    % 奇异性指数
    f_a % 不同层次的分维数
end


end

