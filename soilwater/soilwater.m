function [ output_args ] = soilwater( )
%SOILWATER Summary of this function goes here
%   Detailed explanation goes here
% clc,clear;      //�����Ļ����
% function multifractal(A)
format long g
%����һ������������
DApath=['E:\MATLAB\fenxing code\geardata\zhengchang\'];     % ָ���ļ��й���·��
% zc=[];
for I=1:2   % һ�������ļ�
    DATAfile=['Data1-' int2str(I) '.txt'];      % �������Iָ���ļ�����
    % [DATAfile DApath]=uigetfile('*.txt','�����ź�');
    FILENAME=[DApath,DATAfile];     % ƴ���ļ���·�����ļ���
    data=load(FILENAME);            % �������� data
    data=data(1:4096,1);    % ȡ��һ��
    A=data;     %ָ��AΪ��һ��
    %format long g
    L=length(A);    % ȡA�ĳ���
    i=1;            % ָ��i=1
    modify=1;       % ָ�� modify = 1
    tmin=2;     % �߿��࣬������
    tmax=10;
    ttmin=-10;
    ttmax=10;% �Զ��� q �ķ�Χ
    for r=tmin:1:tmax   %��tmin��ʼ�����Ϊ1��ȡ��tmax
        c(i,1)=mod(L,r);    % ��Lȡr�����������浽����c�ĵ�һ��
        i=i+1;
    end
    c'; % ���㲻�ܱ��߳�r����������,cc��������cת�ã���δ���棿
    a=L-c';% ���㲢�޳������ܱ��߳�r������ԭʼ���ݣ��õ��������ݵĸ���
    n=length(a);  % ���������߳��ĸ�������Ϊ n������߳�������n=9�֣�
    TT=[];
    j=1;
    r=tmin;   % �Զ�����
    for i=1:1:n   % ��n=25-10+1���Զ���Ľ��
        B=A(1:a(i),1);
        U=reshape(B,r,length(B)/r);%�����ף�������������
        T=mean(U);%Ĭ�ϵ�������еľ�ֵ
        T=T'.*r^3;
        TT(1: length(T),i)=[T]; %�����ܶȷֲ�����
        modifying(modify,1)=length(T);
        r=r+1;
        if r>= tmin+n           % �Զ�����
            break;       % �߳�����10+n��������ʼ���ƣ�������Զ���ֹ
        end
        modify=modify+1;
    end
    modifying;
    % TT= nthroot(TT,1); %��TT��n�η��� ��һ�η����������𣿣�����
    % ���߲���С
    % TT;
    %TT=nonzeros(TT); %����TT�еķ���Ԫ��
    for cugb=1:1:n   %cugb=9
        modifying_modifying(cugb,1)=sum(modifying(1:cugb));     % ��Ӱ����¼Ӿ� % & * % �� # @ ���� ����
    end
    modifying_modifying;
    j=1;
    % q Ϊ������������ȡ1��n��Ϊn���� kȡֵ����һ�£�q���󣬼�����޷�ʶ��Ĭ��Ϊ�����q��С������ӽ�0�������岻��ȷ
    for q=ttmin:ttmax           %����ȡ q=-10:1:10
        for k=1:1:n
            X=TT(1:modifying_modifying(k,1),1).^q;
            if k>1
                X=TT(modifying_modifying(k-1,1)+1:modifying_modifying(k,1),1).^q;
            end
            t=sum(X);
            XX(k,j)=[t];             % �����õ�����ѭ���������ǵ����ݺ��������迼�����
        end
        j=j+1;
    end
    XX;                     % �õ��������亯��
    X=log(tmin:1:tmax);
    %
    % X=log(tmax:-1:tmin);          % ��ϵ��ǰ���Զ�����������������4��
    %
    Y=log(XX);
    %
    % figure(1)
    % plot(X',Y,'o-k')        % ���ˣ�������ط����׵ĵ�һ�������亯���������
    %
    %������ָ����(q)
    side_length= tmin:1:tmax;         % �Զ�������߳���������5��
    side_length=side_length';
    q=ttmin:ttmax;                    % q=-5:1:n-10��q=-10:1:10
    m=1;
    [ha,hb]=size(XX);
    for i=1:1:hb
        % XX=XX��;                         % or not
        s=XX(:,i);                        % XX
        b=polyfit(log(side_length),log(s),1);  % �ڶ����߶��¼���б��
        slope(m,1)=b(1,1);
        m=m+1;
    end
    slope;   %  �����Slope��Ϊ����ָ������(q)
    N=polyfit(q', slope,1);
    plot(q', slope)    %  �˲��ǿ����(q)-q ֮��Ĺ�ϵ��
    %
    %������ָ��
    a=diff(slope)./diff(q');   % ���������㣬diff������ƫ��ȷʵ��һ��
    %
    %����ط�����
    q=q';
    f_a=a.*q(1:end-1)-slope(1:end-1);%���ط�����
    %
    % figure(2)
    % a=sort(a,'ascend');
    plot(a,f_a,'o-k')
    %xlabel('��','FontSize',12);
    %ylabel('f(��)','FontSize',12);
    % polyfit(a,f_a,3)
    a=sort(a,'ascend');
    % a+1
    % f_a+1
    a    % ������ָ��
    f_a % ��ͬ��εķ�ά��
end


end

