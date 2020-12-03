function fcellstr = AFFreaddlm(filename,dlm)
%   fcellstr = readdlm(filename,dlm)

fid=fopen(filename);

dumvar = fgets(fid);
count=0;
while ischar(dumvar)
    dumvar = fgets(fid);
    count=count+1;
end

fclose(fid);

ftext=cell(count,1);

fid=fopen(filename);

count=1;
tline = fgets(fid);

while ischar(tline)
    ftext{count,1}=tline;
    tline = fgets(fid);
    count=count+1;
end

fclose(fid);

tmp0=ftext{1,1};
tmp1=textscan(tmp0,'%q','Delimiter',dlm);
tmpcols=size(tmp1{:},1);


fcellstr=cell(size(ftext,1),tmpcols);

for i=1:size(ftext,1)
    tmp=textscan(ftext{i,1},'%q','Delimiter',dlm);
    tmprow=tmp{:}';
        while(size(tmprow,2)<tmpcols); 
            tmprow=[tmprow, NaN];
        end
    fcellstr(i,:)=tmprow;
end