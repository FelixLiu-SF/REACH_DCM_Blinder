function [varargout]=AFFmeta(file_in)
% version 2 2017-0321

warning('off','images:dicominfo:unhandledCharacterSet');

taglist = {...
    '0008','0018'
    '0008','0020'
    '0008','0021'
    '0008','0022'
    '0008','0023'
    '0008','0030'
    '0008','0031'
    '0008','0032'
    '0008','0033'
    '0008','0050'
    '0008','0060'
    '0008','0080'
    '0008','0081'
    '0008','1030'
    '0008','103e'
    '0010','0010'
    '0010','0020'
    '0010','0021'
    '0010','0030'
    '0010','0040'
    '0010','1000'
    '0010','1010'
    '0010','21b0'
    '0018','0015'
    '0020','000d'
    '0020','000e'
    '0032','1060'
    '0040','0254'
    '0002','0002'
    };

varargout = cell(1,size(taglist,1)+1);

if(isdicom(file_in))
    % continue here for DICOM files
    
    varargout{1,1} = 'yes';

    try
        %output DICOM metadata 
        
        try
            [fp,fn,fe]=fileparts(file_in);
        catch filepath_err
            fp = '';
            fn = '';
            fe = '';
        end
        
        
        %check for DICOMDIR/TraumaCAD files
        try
            tmpinfo = dicominfo(file_in);
        catch dcminfo_err
            tmpinfo = struct();
        end
        
        try
            if(isfield(tmpinfo,'MediaStorageSOPClassUID'))
                chkSOP = tmpinfo.MediaStorageSOPClassUID;
                if(~strcmpi(class(chkSOP),'char'))
                    try
                        chkSOP = num2str(chkSOP);
                    catch
                        chkSOP = '';
                    end
                end
            else
                chkSOP = '';
            end
        catch
            chkSOP = '';
        end
           
        try
            if(isfield(tmpinfo,'SoftwareVersion'))
                chkSoftware = tmpinfo.SoftwareVersion;
                if(~strcmpi(class(chkSoftware),'char'))
                    try
                        chkSoftware = num2str(chkSoftware);
                    catch
                        chkSoftware = '';
                    end
                end
            else
                chkSoftware = '';
            end
        catch
            chkSoftware = '';
        end
        
        try
            if(isfield(tmpinfo,'SeriesDescription'))
                chkSeries = tmpinfo.SeriesDescription;
                if(~strcmpi(class(chkSeries),'char'))
                    try
                        chkSeries = num2str(chkSeries);
                    catch
                        chkSeries = '';
                    end
                end
            else
                chkSeries = '';
            end
        catch
            chkSeries = '';
        end
        
        
        if(strcmpi(strtrim(upper(fn)),'DICOMDIR') || strcmpi(strtrim(upper(fn)),'DIRFILE') || strcmpi(chkSOP,'1.2.840.10008.1.3.10') || ~isempty(regexpi(chkSoftware,'TraumaCAD','once')) || ~isempty(regexpi(chkSeries,'TraumaCAD','once')) || ~isempty(regexpi(chkSoftware,'Trauma CAD','once')) || ~isempty(regexpi(chkSeries,'Trauma CAD','once')) )
            %exclude if DICOMDIR/TraumaCAD
            varargout{1,1} = 'no';
            
        elseif(strcmpi(fn,''))
            
            varargout{1,1} = horzcat('error:','filepath');
            
        else %continue if not DICOMDIR/not TraumaCAD
            
            for ix=1:size(taglist,1)

                try
                    tmpmetaname = dicomlookup(taglist{ix,1},taglist{ix,2});

                    if(isfield(tmpinfo,tmpmetaname))
                        %metadata exists for this metatag

                        infograb  = tmpinfo.(tmpmetaname);
                        infoclass = class(infograb);

                        if(strcmpi(infoclass,'struct'))
                            %metadata is a struct, concatenate data
                            infonames = fieldnames(infograb);
                            tmpcat = '';
                            for c=1:size(infonames,1)
                                if(c==size(infonames,1))
                                    tmpcat = horzcat(tmpcat, num2str(infograb.(infonames{c})));
                                else
                                    tmpcat = horzcat(tmpcat, num2str(infograb.(infonames{c})), '^');
                                end
                            end
                            
                            %strip newline/comma characters
                            tmpcat = regexprep(tmpcat,'(\n|\r|\t|\v)',' ');
                            tmpcat = regexprep(tmpcat,',',';');
                            varargout{1,(ix+1)} = tmpcat;
                            
                        elseif(strcmpi(infoclass,'char'))
                            
                            %strip newline/comma characters
                            infograb = regexprep(infograb,'(\n|\r|\t|\v)',' ');
                            infograb = regexprep(infograb,',',';');
                            varargout{1,(ix+1)} = infograb;

                        else
                            %metadata is not a struct
                            varargout{1,(ix+1)} = infograb;

                        end

                    else
                        %metatag is empty
                        varargout{1,(ix+1)} = '';

                    end
                    
                catch
                    %trouble reading metatag
                    varargout{1,(ix+1)} = '.';
                end

            end
        end

    catch dcminfo_err
        % DICOM format error
        varargout{1,1} = horzcat('error:',dcminfo_err.identifier);
        disp(dcminfo_err.message);
    end

else
    % output no if not DICOM format
    varargout{1,1} = 'no';
end
