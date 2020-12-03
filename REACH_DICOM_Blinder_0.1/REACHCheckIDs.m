function [CheckUniquePatient, All_PatientID, All_PatientName]=REACHCheckIDs(hObject, handles, REACHmetadata, REACHheader)

try 

    %REACHheader = {'Filename','IsDICOM','SOPInstanceUID','StudyDate','SeriesDate','AcquisitionDate','ContentDate','StudyTime','SeriesTime','AcquisitionTime','ContentTime','AccessionNumber','Modality','InstitutionName','InstitutionAddress','StudyDescription','SeriesDescription','PatientName','PatientID','IssuerOfPatientID','PatientBirthDate','PatientSex','OtherPatientID','PatientAge','AdditionalPatientHistory','BodyPartExamined','StudyInstanceUID','SeriesInstanceUID','RequestedProcedureDescription','PerformedProcedureStepDescription','MediaStorageSOPClassUID'};

    col_PatientID = find(strcmpi(REACHheader,'PatientID')==1,1,'first');
    col_PatientName = find(strcmpi(REACHheader,'PatientName')==1,1,'first');
    
    All_PatientID = unique(REACHmetadata(:,col_PatientID));
    All_PatientName = unique(REACHmetadata(:,col_PatientName));
    
    if(size(All_PatientID,1)==1 && size(All_PatientName,1)==1)
        CheckUniquePatient = 1;
    else
        CheckUniquePatient = 0;
    end
    
    outputstr_PatientID = '';
    outputstr_PatientName = '';
    
    for ix=1:size(All_PatientID,1)
        outputstr_PatientID = sprintf('%s%s\n',outputstr_PatientID,All_PatientID{ix});
    end
    
    for ix=1:size(outputstr_PatientName,1)
        outputstr_PatientName = sprintf('%s%s\n',outputstr_PatientName,All_PatientName{ix});
    end
    
    set(handles.text_existingid,'String',outputstr_PatientID);
    set(handles.text_existingname,'String',outputstr_PatientName);
    
% try-catch whole subfunc
catch subfuncerr
    
    CheckUniquePatient = 0;
    All_PatientID = {''};
    All_PatientName = {''};
    
    err_out = {'Check IDs ',subfuncerr.message,'.'};
    
    msgbox(err_out);
    
    handles.errorlog =    [handles.errorlog; err_out];
    guidata(hObject,handles);
    
end