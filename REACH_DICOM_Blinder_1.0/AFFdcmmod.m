
function [status,result] = AFFdcmmod(rootstr,dcmfile,tagcell)
% [status,result] = dcmbatchmod(dcmfile,tagcell);
% 
% tagcell = [tagstr,insertstr,im];
% tagcell = {'(0010,0010)','ABCD^^^^','i';...
%               '(0010,0020)','124816','i'};
% 
% dcmfile = 'file.dcm'
% tagstr = '(0010,0010)'
% insertstr = 'A Name'
% i for insert, m for modify, e for erase
% 
% ['','','ep'] for erase private tags
% ['','','imt'] for ignore "tag not found"
% 
% m:\dcmtk\bin\dcmodify -i "(0010,0010)=A Name" file.dcm

if(exist(dcmfile))
    modstr = '';
    endstr = horzcat(' "',dcmfile,'"');
    optstr = ' -ie -nb';
else
    status = 1;
    result = 'Input file does not exist.';
    return;
end

% rootstr = 'C:\dcmtk\bin\dcmodify';
if(~exist(rootstr))
    status = 1;
    result = 'dcmodify not found.';
    return;
end

for ix=1:size(tagcell,1)
    tmptag      =   tagcell{ix,1};
    tmpinsert   =   tagcell{ix,2};
    tmpim       =   tagcell{ix,3};
    tmpappend   =   '';
    
    if(isnumeric(tmpinsert))
        tmpinsert = num2str(tmpinsert);
    end
    
    tmpim = lower(tmpim);
    
    switch tmpim
        case 'i'
            tmpappend = horzcat(' -',tmpim,' "',tmptag,'=',tmpinsert,'"');
        case 'e'
            tmpappend = horzcat(' -',tmpim,' "',tmptag,'"'); 
        case 'ep'
            tmpappend = horzcat(' -',tmpim);
        case 'imt'
            tmpappend = horzcat(' -',tmpim);
        otherwise
            tmpappend = horzcat(' -',tmpim);
    end
    
    modstr = horzcat(modstr,tmpappend);
    
end

dosstr = horzcat(rootstr,optstr,modstr,endstr);

[status,result] = dos(dosstr);

end