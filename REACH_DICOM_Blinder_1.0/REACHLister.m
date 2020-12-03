function [REACHmetadata, REACHheader]=REACHLister(hObject, handles, filelist1, folder_name2)

try 

    REACHheader = {'Filename','IsDICOM','SOPInstanceUID','StudyDate','SeriesDate','AcquisitionDate','ContentDate','StudyTime','SeriesTime','AcquisitionTime','ContentTime','AccessionNumber','Modality','InstitutionName','InstitutionAddress','StudyDescription','SeriesDescription','PatientName','PatientID','IssuerOfPatientID','PatientBirthDate','PatientSex','OtherPatientID','PatientAge','AdditionalPatientHistory','BodyPartExamined','StudyInstanceUID','SeriesInstanceUID','RequestedProcedureDescription','PerformedProcedureStepDescription','MediaStorageSOPClassUID'};

    REACHinfo     = cell(size(filelist1,1),30);
    [REACHinfo(:,1),REACHinfo(:,2),REACHinfo(:,3),REACHinfo(:,4),REACHinfo(:,5),REACHinfo(:,6),REACHinfo(:,7),REACHinfo(:,8),REACHinfo(:,9),REACHinfo(:,10),REACHinfo(:,11),REACHinfo(:,12),REACHinfo(:,13),REACHinfo(:,14),REACHinfo(:,15),REACHinfo(:,16),REACHinfo(:,17),REACHinfo(:,18),REACHinfo(:,19),REACHinfo(:,20),REACHinfo(:,21),REACHinfo(:,22),REACHinfo(:,23),REACHinfo(:,24),REACHinfo(:,25),REACHinfo(:,26),REACHinfo(:,27),REACHinfo(:,28),REACHinfo(:,29),REACHinfo(:,30)] = cellfun(@AFFmeta,filelist1(:,1),'UniformOutput',0);

    REACHmetadata = [filelist1(:,1), REACHinfo];
    
    %AFFdlmtxtwrite(REACHoutput,horzcat(folder_name2,'\AFF_MP_',version,'_',listtype,'.csv'),',','cell','"',1);
    
% try-catch whole subfunc
catch subfuncerr
    
    err_out = {'Listing ',subfuncerr.message,'.'};
    
    handles.errorlog =    [handles.errorlog; err_out];
    guidata(hObject,handles);
    
end