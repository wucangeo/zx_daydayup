function dataout = txtimport( filein )
%IMPORTTXT Summary of this function goes here
%   Detailed explanation goes here
% fidin=fopen(filein,'r');
M = dlmread(filein);    % ??txt????
[m,n] = size(M);        % ????

[dir,filename,ext] = fileparts(filein); % ?????
raindatestr = strcat('20',filename(1:6));   % ???
raindate = strcat('20',filename(1:2),'-',filename(3:4),'-',filename(5:6));  %??--

conn =database('jiangshui','root','noroot','com.mysql.jdbc.Driver','jdbc:mysql://localhost:3306/jiangshui');
tablename = 'rain2014';
colnames = {'m_date','m_dates','sid','m_x','m_y','m_z','m_value'};
if isopen(conn)
    for i = 1:m
        data = {raindate,raindatestr,M(i,1),M(i,2),M(i,3),M(i,4),M(i,5)};
        fastinsert(conn,tablename,colnames,data);
    end
else
    display('MySql Connection Error');
end
close(conn)
end

