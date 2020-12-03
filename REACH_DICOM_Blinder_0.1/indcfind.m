function [ixout]=indcfind(cellin,exprin,type)
% [ixout]=indcfind(M,'[0-9]','regexp')
% [ixout]=indcfind(M,'AbCdE','regexpi')
% [ixout]=indcfind(M,'','nan')
% [ixout]=indcfind(M,'','empty')
% [ixout]=indcfind(M,'~','nan'); returns is not nan
% [ixout]=indcfind(M,'~','empty'); returns is not empty
%
% regexp/regexpi: indices matching regular expression
% use ^exprin$ to match exact phrase
% nan: indices with any NaN found
% empty: indices of empty cells

ixout=[];

% check type
if(~strcmp(lower(type),'regexp') & ~strcmp(lower(type),'regexpi') & ~strcmp(lower(type),'~regexp') & ~strcmp(lower(type),'~regexpi') & ~strcmp(lower(type),'empty') & ~strcmp(lower(type),'nan'))
    disp(horzcat('Unrecognized type: ',type));
    return;
end

% nan
ix1=cellfun(@isnan,cellin,'UniformOutput',0);
ix2=cellfun(@sum,ix1,'UniformOutput',0);
nanix=find(cell2mat(ix2)>0);

% empty
ix1=cellfun(@isempty,cellin,'UniformOutput',0);
emptyix=find(cell2mat(ix1)==1);

clear('ix1','ix2');

if(strcmp(lower(type),'regexp'))
    
    cellin(nanix,1) = {''};
    cellin(emptyix,1) = {''};
    
    ix1=regexp(cellin,exprin);
    ix2=cellfun(@isempty,ix1,'UniformOutput',0);
    ixout=find(cell2mat(ix2)==0);
end

if(strcmp(lower(type),'regexpi'))
    
    cellin(nanix,1) = {''};
    cellin(emptyix,1) = {''};
    
    ix1=regexpi(cellin,exprin);
    ix2=cellfun(@isempty,ix1,'UniformOutput',0);
    ixout=find(cell2mat(ix2)==0);
end

if(strcmp(lower(type),'~regexp'))
    
    cellin(nanix,1) = {''};
    cellin(emptyix,1) = {''};
    
    ix1=regexp(cellin,exprin);
    ix2=cellfun(@isempty,ix1,'UniformOutput',0);
    ixout=find(cell2mat(ix2)==1);
end

if(strcmp(lower(type),'~regexpi'))
    
    cellin(nanix,1) = {''};
    cellin(emptyix,1) = {''};
    
    ix1=regexpi(cellin,exprin);
    ix2=cellfun(@isempty,ix1,'UniformOutput',0);
    ixout=find(cell2mat(ix2)==1);
end

if(strcmp(lower(type),'nan'))
    ix1=cellfun(@isnan,cellin,'UniformOutput',0);
    ix2=cellfun(@sum,ix1,'UniformOutput',0);
    ixout=find(cell2mat(ix2)>0);
    if(strcmp(lower(exprin),'~'))
        tmpix = ixout;
        ixout = setdiff([1:size(cellin,1)]',tmpix);
    end
end

if(strcmp(lower(type),'empty'))
    ix1=cellfun(@isempty,cellin,'UniformOutput',0);
    ixout=find(cell2mat(ix1)==1);
    if(strcmp(lower(exprin),'~'))
        tmpix = ixout;
        ixout = setdiff([1:size(cellin,1)]',tmpix);
    end
end