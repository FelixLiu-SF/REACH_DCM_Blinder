function [AFFoutput, AFFheader]=AFFLister(hObject, handles, filelist1, folder_name2, version, listtype)

try 

    AFFheader = {'Filename','IsDICOM','SOPInstanceUID','StudyDate','SeriesDate','AcquisitionDate','ContentDate','StudyTime','SeriesTime','AcquisitionTime','ContentTime','AccessionNumber','Modality','InstitutionName','InstitutionAddress','StudyDescription','SeriesDescription','PatientName','PatientID','IssuerOfPatientID','PatientBirthDate','PatientSex','OtherPatientID','PatientAge','AdditionalPatientHistory','BodyPartExamined','StudyInstanceUID','SeriesInstanceUID','RequestedProcedureDescription','PerformedProcedureStepDescription','MediaStorageSOPClassUID'};

    AFFinfo     = cell(size(filelist1,1),30);
    [AFFinfo(:,1),AFFinfo(:,2),AFFinfo(:,3),AFFinfo(:,4),AFFinfo(:,5),AFFinfo(:,6),AFFinfo(:,7),AFFinfo(:,8),AFFinfo(:,9),AFFinfo(:,10),AFFinfo(:,11),AFFinfo(:,12),AFFinfo(:,13),AFFinfo(:,14),AFFinfo(:,15),AFFinfo(:,16),AFFinfo(:,17),AFFinfo(:,18),AFFinfo(:,19),AFFinfo(:,20),AFFinfo(:,21),AFFinfo(:,22),AFFinfo(:,23),AFFinfo(:,24),AFFinfo(:,25),AFFinfo(:,26),AFFinfo(:,27),AFFinfo(:,28),AFFinfo(:,29),AFFinfo(:,30)] = cellfun(@AFFmeta,filelist1(:,1),'UniformOutput',0);

    AFFoutput = [AFFheader; [filelist1(:,1), AFFinfo]];
    
    AFFdlmtxtwrite(AFFoutput,horzcat(folder_name2,'\AFF_MP_',version,'_',listtype,'.csv'),',','cell','"',1);
    
% try-catch whole subfunc
catch subfuncerr
    
    err_out = {'Blinding',subfuncerr.message,'.'};
    
    handles.errorlog =    [handles.errorlog; err_out];
    guidata(hObject,handles);
    
end