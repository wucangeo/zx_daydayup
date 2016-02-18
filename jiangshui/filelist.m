function filelist( dirin,dirout )
filelist = dir(dirin);
num = length(filelist);
for i=1:num
    % ????????
    filein = strcat(dirin,'\',filelist(i).name);
    fileout = strcat(dirout , '\' , filelist(i).name);
    
    fprintf('%s\n',filelist(i).name);
    fprintf('%s\n',filein);
    fprintf('%s\n',fileout);

%     txtread(filein,fileout,12);
end

