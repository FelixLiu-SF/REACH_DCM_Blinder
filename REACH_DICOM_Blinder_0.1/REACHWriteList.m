function REACHWriteList(hObject, handles, folder_name2, REACHmetadata, REACHheader, version, listtype)

try 

    REACHoutput = [REACHheader; REACHmetadata];
    
    AFFdlmtxtwrite(REACHoutput,horzcat(folder_name2,'\REACH_Blinding_',version,'_',listtype,'.csv'),',','cell','"',1);
    
% try-catch whole subfunc
catch subfuncerr
    
    err_out = {'Listing ',subfuncerr.message,'.'};
    
    handles.errorlog =    [handles.errorlog; err_out];
    guidata(hObject,handles);
    
end