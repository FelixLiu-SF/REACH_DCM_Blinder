function varargout = REACH_DCM_Blinder_1_0(varargin)
% REACH_DCM_Blinder_1_0 MATLAB code for REACH_DCM_Blinder_1_0.fig
%      REACH_DCM_Blinder_1_0, by itself, creates a new REACH_DCM_Blinder_1_0 or raises the existing
%      singleton*.
%
%      H = REACH_DCM_Blinder_1_0 returns the handle to a new REACH_DCM_Blinder_1_0 or the handle to
%      the existing singleton*.
%
%      REACH_DCM_Blinder_1_0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REACH_DCM_Blinder_1_0.M with the given input arguments.
%
%      REACH_DCM_Blinder_1_0('Property','Value',...) creates a new REACH_DCM_Blinder_1_0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before REACH_DCM_Blinder_1_0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to REACH_DCM_Blinder_1_0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help REACH_DCM_Blinder_1_0

% Last Modified by GUIDE v2.5 03-Dec-2020 12:01:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @REACH_DCM_Blinder_1_0_OpeningFcn, ...
                   'gui_OutputFcn',  @REACH_DCM_Blinder_1_0_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before REACH_DCM_Blinder_1_0 is made visible.
function REACH_DCM_Blinder_1_0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to REACH_DCM_Blinder_1_0 (see VARARGIN)

handles.version = '1_00';
handles.activefile = '';
handles.errorlog = {};

% Choose default command line output for REACH_DCM_Blinder_1_0
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes REACH_DCM_Blinder_1_0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = REACH_DCM_Blinder_1_0_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
varargout{2} = handles;


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton_inputdir.
function pushbutton_inputdir_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_inputdir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    folder_name1 = uigetdir;
    if(folder_name1~=0)
        set(handles.edit1,'String',folder_name1);
    end
    
    
% --- Executes on button press in pushbutton_outputdir.
function pushbutton_outputdir_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_outputdir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    folder_name2 = uigetdir;
    if(folder_name2~=0)
        set(handles.edit2,'String',folder_name2);
    end


% --- Executes on button press in pushbutton_listandblind.
function pushbutton_listandblind_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_listandblind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% LIST & BLIND

    folder_name1 = strtrim(handles.edit1.String);
    folder_name2 = strtrim(handles.edit2.String);
    %file_name3 = strtrim(handles.edit3.String);
    blinding_id =       strtrim(handles.edit_blindingid.String);
    blinding_acrostic = strtrim(handles.edit_blindingacrostic.String);

    try
        set(handles.figure1,'Pointer','watch');
        pause(0.001);
        
        if(strcmpi(folder_name1,folder_name2))
            errordlg('Input or Output directories cannot be the same.','Error');
            filelist1 = [];
            
        elseif(~isempty(folder_name1) && ~isempty(folder_name2))
            [filelist1] = AFFfiletroll(folder_name1,'*','.*',0,0);
            if(size(filelist1,1)<1)
                errordlg('No files found for listing.','Error');
            end
            
        else
            errordlg('Input or Output directory is missing.','Error');
            filelist1 = [];
        end
        
        if(~isempty(folder_name2) && size(filelist1,1)>0 && ~strcmpi(folder_name1,folder_name2))
            
            %[AFFoutput, AFFheader]=AFFLister(handles.output, handles, filelist1, folder_name2, handles.version,'Filelist');
            
            [REACHmetadata, REACHheader]=REACHLister(handles.output, handles, filelist1, folder_name2);
            
            [CheckUniquePatient, All_PatientID, All_PatientName]=REACHCheckIDs(handles.output, handles, REACHmetadata, REACHheader);
            
            REACHWriteList(handles.output, handles, folder_name2, REACHmetadata, REACHheader, handles.version,'Filelist')
            
            handles = guidata(handles.output);
            
            %%
            if(isempty(blinding_id) || isempty(blinding_acrostic))
                %Look for blinding IDs
                
                errordlg('Blinding ID or Acrostic is empty. Listing files only.','Error');
                
            elseif(CheckUniquePatient==1) 
                % check if patient ids and name is unique
                try
                    
                    %AFFBlinder(handles.output, handles, AFFoutput, AFFheader, folder_name2, file_name3, 1);
                    REACHBlinder(handles.output, handles, [REACHheader; REACHmetadata], REACHheader, folder_name2, blinding_id, blinding_acrostic, 1);
                    
                    handles = guidata(handles.output);
                    
                    [filelist2] = AFFfiletroll(folder_name2,'*','.*',0,0);
                    
                    %[AFFoutput2]=AFFLister(handles.output, handles, filelist2, folder_name2, handles.version,'Blindedlist');
                    
                    [REACHmetadata2, REACHheader2]=REACHLister(handles.output, handles, filelist2, folder_name2);
                    REACHWriteList(handles.output, handles, folder_name2, REACHmetadata2, REACHheader2, handles.version,'Blindedlist')
                    
                    handles = guidata(handles.output);
                    
                catch blinding_err
                    
                    err_out = {'Main',blinding_err.message,'.'};
                    
                    handles.errorlog =    [handles.errorlog; err_out];
                    guidata(hObject,handles);
                    
                end
                
                handles = guidata(handles.output);
                if(size(handles.errorlog,1)>0)
                    
                    AFFdlmtxtwrite([{'Function','Message','File'}; handles.errorlog],horzcat(folder_name2,'\AFF_MP_',handles.version,'_','ErrorLog','.csv'),',','cell','"',1);
                    
                    errstr = sprintf('%s\r\n\r\n%s',horzcat('An error was encountered during blinding'),horzcat('Please check inventory list and error log files.'));
                    errordlg(errstr,'Error');
                    
                else
                    msgbox('Blinding has successfully completed.','Blinding');
                    winopen(folder_name2);
                end
                
            else
                errordlg('More than one Patient ID or Name found. Listing files only.','Error');
            end

        end

        set(handles.figure1,'Pointer','arrow');

    catch run3_err
        pause(1);
        disp(run3_err.message);
        set(handles.figure1,'Pointer','arrow');
    end
    
% --- Executes on button press in pushbutton_exit.
function pushbutton_exit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% EXIT SOFTWARE 

    close(handles.figure1);
    



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_blindingfile.
function pushbutton_blindingfile_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_blindingfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    [file_name3, folder_name3] = uigetfile('*.csv');
    if(file_name3~=0)
        set(handles.edit3,'String',horzcat(folder_name3,file_name3));
    end


% --- Executes on button press in pushbutton_list.
function pushbutton_list_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% LISTING ONLY 

    folder_name1 = strtrim(handles.edit1.String);
    folder_name2 = strtrim(handles.edit2.String);

    try
        set(handles.figure1,'Pointer','watch');
        pause(0.001);
        
        if(strcmpi(folder_name1,folder_name2))
            errordlg('Input or Output directories cannot be the same.','Error');
            filelist1 = [];
            
        elseif(~isempty(folder_name1) && ~isempty(folder_name2))
            [filelist1] = AFFfiletroll(folder_name1,'*','.*',0,0);
            if(size(filelist1,1)<1)
                errordlg('No files found for listing.','Error');
            end
            
        else
            errordlg('Input or Output directory is missing.','Error');
            filelist1 = [];
        end
        
        if(~isempty(folder_name2) && size(filelist1,1)>0 && ~strcmpi(folder_name1,folder_name2))
                   
            %[AFFoutput, AFFheader]=AFFLister(handles.output, handles, filelist1, folder_name2, handles.version,'Filelist');
            
            [REACHmetadata, REACHheader]=REACHLister(handles.output, handles, filelist1, folder_name2);
            
            [CheckUniquePatient, All_PatientID, All_PatientName]=REACHCheckIDs(handles.output, handles, REACHmetadata, REACHheader);
            
            REACHWriteList(handles.output, handles, folder_name2, REACHmetadata, REACHheader, handles.version,'Filelist')
            
            handles = guidata(handles.output);
            
            set(handles.figure1,'Pointer','arrow');
            msgbox('Listing has successfully completed.','Listing');
            
        end
        
    catch list_err
        
        set(handles.figure1,'Pointer','arrow');
        errordlg(horzcat('Error with listing files: ',list_err.message),'Error');
                
    end


% --- Executes on button press in pushbutton_unblind.
function pushbutton_unblind_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_unblind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% UNBLINDING

    folder_name1 = strtrim(handles.edit1.String);
    folder_name2 = strtrim(handles.edit2.String);
    file_name3 = strtrim(handles.edit3.String);

    try
        set(handles.figure1,'Pointer','watch');
        pause(0.001);
        
        if(strcmpi(folder_name1,folder_name2))
            errordlg('Input or Output directories cannot be the same.','Error');
            filelist1 = [];
            
        elseif(~isempty(folder_name1) && ~isempty(folder_name2))
            [filelist1] = AFFfiletroll(folder_name1,'*','.*',0,0);
            if(size(filelist1,1)<1)
                errordlg('No files found for listing.','Error');
            end
            
        else
            errordlg('Input or Output directory is missing.','Error');
            filelist1 = [];
        end
        
        if(~isempty(folder_name2) && size(filelist1,1)>0 && ~strcmpi(folder_name1,folder_name2))
            
            [AFFoutput, AFFheader]=AFFLister(handles.output, handles, filelist1, folder_name2, handles.version,'FilesForUnblinding');
            handles = guidata(handles.output);
            
            %%
            if(isempty(file_name3))
                errordlg('Blinding spreadsheet file could not be found. Listing files only.','Error');
%                 AFFdlmtxtwrite(AFFoutput,horzcat(folder_name2,'\AFF_MP_0_9_FilesForUnblinding.csv'),',','cell','"',1);
                
            elseif(exist(file_name3,'file')) %Look for blinding IDs
                try
                    
                    AFFBlinder(handles.output, handles, AFFoutput, AFFheader, folder_name2, file_name3, -1);
                    handles = guidata(handles.output);
                    
                    [filelist2] = AFFfiletroll(folder_name2,'*','.*',0,0);
                    
                    [AFFoutput2]=AFFLister(handles.output, handles, filelist2, folder_name2, handles.version,'Unblindedlist');
                    handles = guidata(handles.output);
                    
                catch blinding_err
                    
                    err_out = {'Main',blinding_err.message,'.'};
                    
                    handles.errorlog =    [handles.errorlog; err_out];
                    guidata(hObject,handles);
                    
                end
                
                handles = guidata(handles.output);
                if(size(handles.errorlog,1)>0)
                    
                    AFFdlmtxtwrite([{'Function','Message','File'}; handles.errorlog],horzcat(folder_name2,'\AFF_MP_',handles.version,'_','ErrorLog','.csv'),',','cell','"',1);
                    
                    errstr = sprintf('%s\r\n\r\n%s',horzcat('An error was encountered during unblinding'),horzcat('Please check inventory list and error log files.'));
                    errordlg(errstr,'Error');
                    winopen(folder_name2);
                    
                else
                    msgbox('Unblinding has successfully completed.','Unblinding');
                    winopen(folder_name2);
                end
                
            else
                errordlg('Blinding spreadsheet file could not be found. Listing files only.','Error');
            end

        end

        set(handles.figure1,'Pointer','arrow');

    catch run3_err
        pause(1);
        disp(run3_err.message);
        set(handles.figure1,'Pointer','arrow');
    end
    
    



function edit_blindingid_Callback(hObject, eventdata, handles)
% hObject    handle to edit_blindingid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_blindingid as text
%        str2double(get(hObject,'String')) returns contents of edit_blindingid as a double


% --- Executes during object creation, after setting all properties.
function edit_blindingid_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_blindingid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_blindingacrostic_Callback(hObject, eventdata, handles)
% hObject    handle to edit_blindingacrostic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_blindingacrostic as text
%        str2double(get(hObject,'String')) returns contents of edit_blindingacrostic as a double


% --- Executes during object creation, after setting all properties.
function edit_blindingacrostic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_blindingacrostic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_checkid.
function pushbutton_checkid_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_checkid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Check Patient Names and IDs

    folder_name1 = strtrim(handles.edit1.String);
    folder_name2 = strtrim(handles.edit2.String);

    try
        set(handles.figure1,'Pointer','watch');
        pause(0.001);
        
%         if(strcmpi(folder_name1,folder_name2))
%             errordlg('Input or Output directories cannot be the same.','Error');
%             filelist1 = [];
            
        if(~isempty(folder_name1))
            [filelist1] = AFFfiletroll(folder_name1,'*','.*',0,0);
            if(size(filelist1,1)<1)
                errordlg('No files found for listing.','Error');
            end
            
        else
            errordlg('Input directory is missing.','Error');
            filelist1 = [];
        end
        
        if(size(filelist1,1)>0 && ~strcmpi(folder_name1,folder_name2))
            
            [REACHmetadata, REACHheader]=REACHLister(handles.output, handles, filelist1, folder_name2);
            
            [CheckUniquePatient, All_PatientID, All_PatientName]=REACHCheckIDs(handles.output, handles, REACHmetadata, REACHheader);
            
            handles = guidata(handles.output);
            
            set(handles.figure1,'Pointer','arrow');
            
        end
        
    catch list_err
        
        set(handles.figure1,'Pointer','arrow');
        errordlg(horzcat('Error with checking files: ',list_err.message),'Error');
                
    end
    
