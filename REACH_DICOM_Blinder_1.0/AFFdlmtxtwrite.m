function dlmtxtwrite(varargin)
% dlmtxtwrite(dataname,filename,dlm,dataclass,stringidentifier,datarow)
% function dlmtxtwrite(dataname,filename,dlm,dataclass,stringidentifier,datarow)
% dlmtxtwrite(dataname,'test.csv',',','cell','"',2)
% dlmtxtwrite(dataname,'test.txt','|','matrix','',1)

dataname = varargin{1};
filename = varargin{2};

if(size(varargin,2)<3)
    dlm = ',';
else
    dlm = varargin{3};
end

if(size(varargin,2)<4)
    dataclass = class(dataname);
else
    dataclass = varargin{4};
end

if(size(varargin,2)<5)
    strid = '';
else
    strid = varargin{5};
end
if(size(varargin,2)<6)
    datarow = 2;
else
    datarow = varargin{6};
end


if(strcmp(dataclass,'cell'))
    [nrows,ncols]= size(dataname);
    
    colstr = [];
    for col=1:ncols
        coltype = cellfun(@class,dataname(datarow:end,col),'UniformOutput',0); 
        coltype = unique(coltype);
        if(~isempty(intersect(coltype,'char')))
            colstr(1,col) = 1;
        else
            colstr(1,col) = 0;
        end
    end
    fid = fopen(filename, 'w');
    for row=1:nrows
    for col=1:ncols
        if(colstr(1,col))
            outcell = horzcat(strid,num2str(dataname{row,col}),strid);
        else
            outcell = num2str(dataname{row,col});
        end
        if(row<datarow)
            outcell = horzcat(strid,num2str(dataname{row,col}),strid);
        end
        fprintf(fid,'%s', outcell);
    if(col~=ncols); fprintf(fid,'%s',dlm); end;
    end
    fprintf(fid,'%s\r\n','');
    end
    fclose(fid);
end


if(strcmp(dataclass,'matrix'))
    [nrows,ncols]= size(dataname);

    fid = fopen(filename, 'w');
    for row=1:nrows
    for col=1:ncols
        if(ischar(dataname(row,col)))
            outcell = horzcat(strid,num2str(dataname(row,col)),strid);
        else
            outcell = num2str(dataname(row,col));
        end
        fprintf(fid,'%s', outcell);
    if(col~=ncols); fprintf(fid,'%s',dlm); end;
    end
    fprintf(fid,'%s\r\n','');
    end
    fclose(fid);
end