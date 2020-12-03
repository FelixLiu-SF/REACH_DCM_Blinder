function [filelist] = AFFfiletroll(CurrPath,namereg,extreg,namexact,extexact)
% [filelist] = filetroll(CurrPath,namereg,extreg,namexact,extexact)
% [filelist] = filetroll(cd,'DAT','.*',0,0)
% [filelist] = filetroll(cd,'*','.dcm',0,1)

global extvar
global namevar
extvar=extreg;
namevar=namereg;

if(size(extvar,2)>1)
    if(~strcmp(extvar(1:2),'\.')) % format to "\." for regular expr
        if(strcmp(extvar(1),'.'))
            extvar=horzcat('\',extvar);
        else
            extvar=horzcat('\.',extvar);
        end
    end
end

if(namexact>0) %change regular expr, if for exact match
    namevar=horzcat('\<',namevar,'\>');
end
if(extexact>0)
    extvar=horzcat(extvar(1:2),'\<',extvar(3:end),'\>');
end

if nargin == 0
   CurrPath = cd;
   namevar = '*';
   extvar = '.*';
end

    sub='';
    sub{end+1}=[CurrPath];
    fls='';
    tmp = dir(CurrPath);
    fls{end+1} = {tmp(~[tmp.isdir]).name};
    tmplist={};
        

    [~, partname, partext] = cellfun(@fileparts,{tmp(~[tmp.isdir]).name},'UniformOutput',0);
    [tmpext,extlogic] = cellfun(@filterfile,partname,partext,'UniformOutput',0);
    tmpext={tmpext([extlogic{:}]==1)}; tmpext=tmpext{:}; tmpext=sortrows(tmpext');
    
    if(~isempty(tmpext))
        for m=1:size(tmpext,1)
            tmplist{end+1,1}=horzcat(sub{end},'\',tmpext{m});
            tmplist{end,2}=horzcat(sub{end},'\');
            tmplist{end,3}=tmpext{m};
        end
    end

    
   [sub, fls, tmplist] = subfolder(CurrPath,sub,fls, tmplist);
   
   filelist=tmplist;
       


       
function [sub,fls, tmplist] = subfolder(CurrPath,sub,fls, tmplist)
%------------------------------------------------
global extvar
global namevar

tmp = dir(CurrPath);
tmp = tmp(~ismember({tmp.name},{'.' '..'}));
for i = {tmp([tmp.isdir]).name}
    
  sub{end+1} = [CurrPath '\' i{:}];
  tmp = dir(sub{end});
  fls{end+1} = {tmp(~[tmp.isdir]).name};
  
  
    [~, partname, partext] = cellfun(@fileparts,{tmp(~[tmp.isdir]).name},'UniformOutput',0);
    [tmpext,extlogic] = cellfun(@filterfile,partname,partext,'UniformOutput',0);
    tmpext={tmpext([extlogic{:}]==1)}; tmpext=tmpext{:}; tmpext=sortrows(tmpext');
    
    if(~isempty(tmpext))
        for m=1:size(tmpext,1)
            tmplist{end+1,1}=horzcat(sub{end},'\',tmpext{m});
            tmplist{end,2}=horzcat(sub{end},'\');
            tmplist{end,3}=tmpext{m};
        end
    end
      
      
    [sub fls tmplist] = subfolder(sub{end},sub,fls, tmplist);

end

function [validext, extlogic]=filterfile(nameinput,extinput)
%------------------------------------------------
global extvar
global namevar

% make regular expressions, checking for *-wildcards
namestar=find(namevar=='*');
if(~isempty(namestar))
    name1 = strrep(namevar,'*','');
    name2 = strrep(namevar,'*','\w+');
    nameregexp = horzcat('(',name1,'|',name2,')'); %if there is a wildcard, account for cases of * = 0-char
else
    nameregexp = namevar; % no *-wildcards, use inputed string
end
    
extstar=find(extvar=='*');
if(~isempty(extstar))
    ext1 = strrep(extvar,'*','');
    ext2 = strrep(extvar,'*','\w+');
    extregexp = horzcat('(',ext1,'|',ext2,')');
else
    extregexp = extvar;
end

namechk = regexpi(nameinput,nameregexp); %does this filename match name string?
if(~isempty(namechk))
    nlogic=1;
else
    nlogic=0;
end
extchk = regexpi(extinput,extregexp); %does this extension match extension string?
if(~isempty(extchk))
    elogic=1;
else
    elogic=0;
end

if(strcmp('*',namevar)) % correct logic output if input is pure *-wildcard
    nlogic=1;
end
if(strcmp('\.*',extvar))
    elogic=1;
end
if(isempty(extvar) && isempty(extinput))
    elogic=1;
end

extlogic=nlogic*elogic; % do both name and extension match?
if(extlogic==1)
    validext=horzcat(nameinput,extinput);
else
    validext='';
end


