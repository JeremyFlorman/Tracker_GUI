function varargout = Tracker_GUI(varargin)
% TRACKER_GUI MATLAB code for Tracker_GUI.fig
%      TRACKER_GUI, by itself, creates a new TRACKER_GUI or raises the existing
%      singleton*.

%
%      H = TRACKER_GUI returns the handle to a new TRACKER_GUI or the handle to
%      the existing singleton*.
%
%      TRACKER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRACKER_GUI.M with the given input arguments.
%      TRACKER_GUI('Property','Value',...) creates a new TRACKER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tracker_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tracker_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tracker_GUI

% Last Modified by GUIDE v2.5 01-Jul-2022 15:53:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Tracker_GUI_OpeningFcn, ...
    'gui_OutputFcn',  @Tracker_GUI_OutputFcn, ...
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


% --- Executes just before Tracker_GUI is made visible.
function Tracker_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tracker_GUI (see VARARGIN)

% Choose default command line output for Tracker_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);




% UIWAIT makes Tracker_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tracker_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = getappdata(hObject, 'NormalizedReversals');%handles.output;



function scale_Callback(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text1 as text
%        str2double(get(hObject,'String')) returns contents of text1 as a double
global scale
scale = get(handles.scale,'String');


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Reoutline.
function Reoutline_Callback(hObject, eventdata, handles)
% hObject    handle to Reoutline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Reoutline
global reoutlineG
global reoutlineO
reoutlineG = get(hObject, 'Value');
if reoutlineG == 1
    reoutlineO = '--plugin reoutline';
else reoutlineO = '';
end

% --- Executes on button press in Respine.
function Respine_Callback(hObject, eventdata, handles)
% hObject    handle to Respine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Respine
global respineG
global respineO
respineG = get(hObject, 'Value');
if respineG == 1
    respineO = '--plugin respine';
else respineO = '';
end

% --- Executes on button press in Shadowless.
function Shadowless_Callback(hObject, eventdata, handles)
% hObject    handle to Shadowless (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Shadowless


% --- Executes on button press in Curvaceous.
function Curvaceous_Callback(hObject, eventdata, handles)
% hObject    handle to Curvaceous (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Curvaceous



function MinDistance_Callback(hObject, eventdata, handles)
% hObject    handle to MinDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MinDistance as text
%        str2double(get(hObject,'String')) returns contents of MinDistance as a double


% --- Executes during object creation, after setting all properties.
function MinDistance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MinDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MinTime_Callback(hObject, eventdata, handles)
% hObject    handle to MinTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MinTime as text
%        str2double(get(hObject,'String')) returns contents of MinTime as a double


% --- Executes during object creation, after setting all properties.
function MinTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MinTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DataSpacing_Callback(hObject, eventdata, handles)
% hObject    handle to DataSpacing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DataSpacing as text
%        str2double(get(hObject,'String')) returns contents of DataSpacing as a double


% --- Executes during object creation, after setting all properties.
function DataSpacing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DataSpacing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SpeedWindow_Callback(hObject, eventdata, handles)
% hObject    handle to SpeedWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SpeedWindow as text
%        str2double(get(hObject,'String')) returns contents of SpeedWindow as a double


% --- Executes during object creation, after setting all properties.
function SpeedWindow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SpeedWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FwdBiasDistance_Callback(hObject, eventdata, handles)
% hObject    handle to FwdBiasDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FwdBiasDistance as text
%        str2double(get(hObject,'String')) returns contents of FwdBiasDistance as a double


% --- Executes during object creation, after setting all properties.
function FwdBiasDistance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FwdBiasDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in VelocityUnits.
function VelocityUnits_Callback(hObject, eventdata, handles)
% hObject    handle to VelocityUnits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns VelocityUnits contents as cell array
%        contents{get(hObject,'Value')} returns selected item from VelocityUnits


% --- Executes during object creation, after setting all properties.
function VelocityUnits_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VelocityUnits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DisplayType.
function DisplayType_Callback(hObject, eventdata, handles)
% hObject    handle to DisplayType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DisplayType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DisplayType


% --- Executes during object creation, after setting all properties.
function DisplayType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DisplayType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SpecificTime.
function SpecificTime_Callback(hObject, eventdata, handles)
% hObject    handle to SpecificTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SpecificTime

% --- Executes on button press in Flux.
function Flux_Callback(hObject, eventdata, handles)
% hObject    handle to Flux (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Flux


% --- Executes on button press in MeasureReversal.
function MeasureReversal_Callback(hObject, eventdata, handles)
% hObject    handle to MeasureReversal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MeasureReversal


% --- Executes on button press in Eigenspine.
function Eigenspine_Callback(hObject, eventdata, handles)
% hObject    handle to Eigenspine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Eigenspine



function ToTime_Callback(hObject, eventdata, handles)
% hObject    handle to ToTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ToTime as text
%        str2double(get(hObject,'String')) returns contents of ToTime as a double


% --- Executes during object creation, after setting all properties.
function ToTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ToTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FromTime_Callback(hObject, eventdata, handles)
% hObject    handle to FromTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FromTime as text
%        str2double(get(hObject,'String')) returns contents of FromTime as a double


% --- Executes during object creation, after setting all properties.
function FromTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FromTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Frame.
function Frame_Callback(hObject, eventdata, handles)
% hObject    handle to Frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Frame


% --- Executes on button press in ID.
function ID_Callback(hObject, eventdata, handles)
% hObject    handle to ID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ID


% --- Executes on button press in Objects.
function Objects_Callback(hObject, eventdata, handles)
% hObject    handle to Objects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Objects


% --- Executes on button press in GoodObjects.
function GoodObjects_Callback(hObject, eventdata, handles)
% hObject    handle to GoodObjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of GoodObjects


% --- Executes on button press in Persistance.
function Persistance_Callback(hObject, eventdata, handles)
% hObject    handle to Persistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Persistance


% --- Executes on button press in Area.
function Area_Callback(hObject, eventdata, handles)
% hObject    handle to Area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Area


% --- Executes on button press in Speed.
function Speed_Callback(hObject, eventdata, handles)
% hObject    handle to Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Speed


% --- Executes on button press in AngularSpeed.
function AngularSpeed_Callback(hObject, eventdata, handles)
% hObject    handle to AngularSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AngularSpeed


% --- Executes on button press in Length.
function Length_Callback(hObject, eventdata, handles)
% hObject    handle to Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Length


% --- Executes on button press in RelativeLength.
function RelativeLength_Callback(hObject, eventdata, handles)
% hObject    handle to RelativeLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RelativeLength


% --- Executes on button press in Width.
function Width_Callback(hObject, eventdata, handles)
% hObject    handle to Width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Width


% --- Executes on button press in Aspect.
function Aspect_Callback(hObject, eventdata, handles)
% hObject    handle to Aspect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Aspect


% --- Executes on button press in RelativeWidth.
function RelativeWidth_Callback(hObject, eventdata, handles)
% hObject    handle to RelativeWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RelativeWidth


% --- Executes on button press in RelativeAspect.
function RelativeAspect_Callback(hObject, eventdata, handles)
% hObject    handle to RelativeAspect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RelativeAspect


% --- Executes on button press in MidlineWidth.
function MidlineWidth_Callback(hObject, eventdata, handles)
% hObject    handle to MidlineWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MidlineWidth


% --- Executes on button press in MidlineLength.
function MidlineLength_Callback(hObject, eventdata, handles)
% hObject    handle to MidlineLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MidlineLength


% --- Executes on button press in Kink.
function Kink_Callback(hObject, eventdata, handles)
% hObject    handle to Kink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Kink


% --- Executes on button press in Bias.
function Bias_Callback(hObject, eventdata, handles)
% hObject    handle to Bias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Bias


% --- Executes on button press in Curvature.
function Curvature_Callback(hObject, eventdata, handles)
% hObject    handle to Curvature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Curvature


% --- Executes on button press in PathLength.
function PathLength_Callback(hObject, eventdata, handles)
% hObject    handle to PathLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PathLength


% --- Executes on button press in DirectionalConstancy.
function DirectionalConstancy_Callback(hObject, eventdata, handles)
% hObject    handle to DirectionalConstancy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DirectionalConstancy


% --- Executes on button press in LocX.
function LocX_Callback(hObject, eventdata, handles)
% hObject    handle to LocX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of LocX


% --- Executes on button press in LocY.
function LocY_Callback(hObject, eventdata, handles)
% hObject    handle to LocY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of LocY


% --- Executes on button press in VelX.
function VelX_Callback(hObject, eventdata, handles)
% hObject    handle to VelX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of VelX


% --- Executes on button press in VelY.
function VelY_Callback(hObject, eventdata, handles)
% hObject    handle to VelY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of VelY


% --- Executes on button press in Orientation.
function Orientation_Callback(hObject, eventdata, handles)
% hObject    handle to Orientation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Orientation


% --- Executes on button press in Crab.
function Crab_Callback(hObject, eventdata, handles)
% hObject    handle to Crab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Crab


% --- Executes on button press in Tap.
function Tap_Callback(hObject, eventdata, handles)
% hObject    handle to Tap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Tap



function Custom_Callback(hObject, eventdata, handles)
% hObject    handle to Custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Custom as text
%        str2double(get(hObject,'String')) returns contents of Custom as a double


% --- Executes during object creation, after setting all properties.
function Custom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on text1 and none of its controls.
function scale_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in SelectData.
function SelectData_Callback(hObject, eventdata, handles)
% hObject    handle to SelectData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

recentpath = get(hObject, 'UserData');
global foldername
if ~ischar(recentpath)
    startpath = 'C:\Users\MWT\Desktop\Jeremy\';
elseif ischar(recentpath)
    uppath = regexp(recentpath, '\', 'split');
    recentpath = strrep(recentpath, uppath{end}, '');
    startpath = recentpath;
end

foldername=uigetdir(startpath, 'wheres ya data chump?');

set(hObject, 'UserData', foldername);

% --- Executes on selection change in RevTrigger.
function RevTrigger_Callback(hObject, eventdata, handles)
% hObject    handle to RevTrigger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RevTrigger contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RevTrigger


% --- Executes during object creation, after setting all properties.
function RevTrigger_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RevTrigger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DT_Callback(hObject, eventdata, handles)
% hObject    handle to DT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DT as text
%        str2double(get(hObject,'String')) returns contents of DT as a double


% --- Executes during object creation, after setting all properties.
function DT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IDT_Callback(hObject, eventdata, handles)
% hObject    handle to IDT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IDT as text
%        str2double(get(hObject,'String')) returns contents of IDT as a double


% --- Executes during object creation, after setting all properties.
function IDT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IDT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TooBrief_Callback(hObject, eventdata, handles)
% hObject    handle to TooBrief (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TooBrief as text
%        str2double(get(hObject,'String')) returns contents of TooBrief as a double


% --- Executes during object creation, after setting all properties.
function TooBrief_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TooBrief (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TooSmall_Callback(hObject, eventdata, handles)
% hObject    handle to TooSmall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TooSmall as text
%        str2double(get(hObject,'String')) returns contents of TooSmall as a double


% --- Executes during object creation, after setting all properties.
function TooSmall_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TooSmall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to ToTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ToTime as text
%        str2double(get(hObject,'String')) returns contents of ToTime as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ToTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to FromTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FromTime as text
%        str2double(get(hObject,'String')) returns contents of FromTime as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FromTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SpecificTime.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to SpecificTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SpecificTime


% --- Executes on button press in Collect.
function Collect_Callback(hObject, eventdata, handles)
% hObject    handle to Collect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Collect



function BinSize_Callback(hObject, eventdata, handles)
% hObject    handle to BinSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BinSize as text
%        str2double(get(hObject,'String')) returns contents of BinSize as a double


% --- Executes during object creation, after setting all properties.
function BinSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BinSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on key press with focus on gencode and none of its controls.
function gencode_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to gencode (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)






function codehome_Callback(hObject, eventdata, handles)
% hObject    handle to codehome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of codehome as text
%        str2double(get(hObject,'String')) returns contents of codehome as a double



% --- Executes during object creation, after setting all properties.
function codehome_CreateFcn(hObject, eventdata, handles)
% hObject    handle to codehome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






% --- Executes on button press in gobutton.
function gobutton_Callback(hObject, eventdata, handles)
% hObject    handle to gobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%general options
global outputheaders
global f
global D
global n
global N
global p
global e
global s
global S
global l
global L
global w
global W
global a
global A
global m
global M
global k
global b
global P
global c
global d
global x
global y
global u
global v
global o
global r
global t

global f1
global D1
global n1
global N1
global p1
global e1
global s1
global S1
global l1
global L1
global w1
global W1
global a1
global A1
global m1
global M1
global k1
global b1
global P1
global c1
global d1
global x1
global y1
global u1
global v1
global o1
global r1
global t1

foldername = get(handles.SelectData, 'UserData');
global codeout
specific = get(handles.SpecificTime, 'Value');
spdwin = '';
fwdbiasdist = '';

mindistance =[' -M ', num2str(get(handles.MinDistance, 'String'))];
mintime = [' -t ', num2str(get(handles.MinTime, 'String'))];
dataspace = [' -T ', num2str(get(handles.DataSpacing, 'String'))];
speedwind = [' -s ', num2str(get(handles.SpeedWindow, 'String'))];
fwddist = [' --minimum-biased ' num2str(get(handles.FwdBiasDistance, 'String'))];

%% Calibration and autoscaling
useautoscale = get(handles.AutoScale, 'Value');

if useautoscale == 1

    urname = regexp(foldername, '\', 'split');
    urpath = strrep(foldername, urname{end}, '');

    prescale = AutoScale(urpath)
    set(handles.scale, 'String', prescale)

elseif useautoscale == 0
    prescale = get(handles.scale, 'String');
end


scaled = num2str(1/str2num(prescale));
rescaled = [' -p ' scaled];
%%


from = num2str(get(handles.FromTime, 'String'));
to = num2str(get(handles.ToTime, 'String'));
spec = '';
if specific == 1
    spec = [' --from ' from ' --to ' to];
elseif specific == 0
    spec ='';
end
%% pulldown menus

velchoice = get(handles.VelocityUnits, 'Value');
dispchoice = get(handles.DisplayType, 'Value');
lengthunits = '';
disptype = '';

if velchoice == 1
    lengthunits = ' --body-length-units';
elseif velchoice == 0
    lengthunits = '';
end


if dispchoice == 1
    disptype = ' --map ';
elseif dispchoice == 2
    disptype = ' -I ';
end

%% outputs
frame = get(handles.Frame, 'Value');
if frame == 1
    f = 'frame,';
    f1 = 'frame ';
elseif frame == 0
    f = '';

end
ID = get(handles.ID, 'Value');
if ID == 1
    D = 'id,';
    D1 = 'ID ';
elseif ID == 0
    D = '';

end
objects = get(handles.Objects, 'Value');
if objects == 1
    n = 'number,';
    n1 = 'Number ';
elseif objects == 0
    n = '';

end
goodobjects = get(handles.GoodObjects, 'Value');
if goodobjects == 1
    N = 'goodnumber,';
    N1 = 'Good Number ';
elseif goodobjects == 0
    N = '';

end
persistance = get(handles.Persistance, 'Value');
if persistance == 1
    p = 'persistence,';
    p1 = 'Persistence ';
elseif persistance == 0
    p = '';

end
area = get(handles.Area, 'Value');
if area == 1
    e = 'area,';
    e1 = 'Area ';
elseif area == 0
    e = '';

end
speed = get(handles.Speed, 'Value');
if speed == 1
    s = 'speed,';
    s1 = 'Speed ';
elseif speed == 0
    s = '';

end
angspeed = get(handles.AngularSpeed, 'Value');
if angspeed == 1
    S = 'angular,';
    S1 = 'Angular Velocity ';
elseif angspeed == 0
    S = '';

end
length = get(handles.Length, 'Value');
if length == 1
    l = 'length,';
    l1 = 'Length ';
elseif length == 0
    l = '';

end

rellength = get(handles.RelativeLength, 'Value');
if rellength == 1
    L = 'rellength,';
    L1 = 'Relative Length ';
elseif rellength == 0
    L = '';

end
width = get(handles.Width, 'Value');
if width == 1
    w = 'width,';
    w1 = 'Width ';
elseif width == 0
    w = '';

end
relwidth = get(handles.RelativeWidth, 'Value');
if relwidth == 1
    W = 'relwidth,';
    W1 = 'Relative Width ';
elseif relwidth == 0
    W = '';

end
aspect = get(handles.Aspect, 'Value');
if aspect == 1
    a = 'aspect,';
    a1 = 'Aspect ';
elseif aspect == 0
    a = '';

end
relaspect = get(handles.RelativeAspect, 'Value');
if relaspect == 1
    A = 'relaspect,';
    A1 = 'Relative Aspect ';
elseif relaspect == 0
    A = '';

end
midlength = get(handles.MidlineLength, 'Value');
if midlength == 1
    m = 'midline,';
    m1 = 'Midline Length ';
elseif midlength == 0
    m = '';

end
midwidth = get(handles.MidlineWidth, 'Value');
if midwidth == 1
    M = 'morphwidth,';
    M1 = 'Midline Width ';
elseif midwidth == 0
    M = '';

end
kink = get(handles.Kink, 'Value');
if kink == 1
    k = 'kink,';
    k1 = 'Kink ';
elseif kink == 0
    k = '';

end
bias = get(handles.Bias, 'Value');
if bias == 1
    b = 'bias,';
    b1 = 'Bias ';
elseif bias == 0
    b = '';

end
pathlength = get(handles.PathLength, 'Value');
if pathlength == 1
    P = 'pathlen,';
    P1 = 'Pathlength ';
elseif pathlength == 0
    P = '';

end
curve = get(handles.Curvature, 'Value');
if curve == 1
    c = 'curve,';
    c1 = 'Curvature ';
elseif curve == 0
    c = '';

end
direction = get(handles.DirectionalConstancy, 'Value');
if direction == 1
    d = 'dir,';
    d1 = 'Dir ';
elseif direction == 0
    d = '';

end
lox = get(handles.LocX, 'Value');
if lox == 1
    x = 'loc_x,';
    x1 = 'X location ';
elseif lox == 0
    x = '';

end
loy = get(handles.LocY, 'Value');
if loy == 1
    y = 'loc_y,';
    y1 = 'Y Location ';
elseif loy == 0
    y = '';

end
vex = get(handles.VelX, 'Value');
if vex == 1
    u = 'vel_x,';
    u1 = 'X Velocity ';
elseif vex == 0
    u = '';

end
vey = get(handles.VelY, 'Value');
if vey == 1
    v = 'vel_y,';
    v1 = 'Y Velocity ';
elseif vey == 0
    v = '';

end
orientation = get(handles.Orientation, 'Value');
if orientation == 1
    o = 'orient,';
    o1 = 'Orientation ';
elseif orientation == 0
    o = '';

end
crab = get(handles.Crab, 'Value');
if crab == 1
    r = 'crab,';
    r1 = 'Crab ';
elseif crab == 0
    r = '';

end
tap = get(handles.Tap, 'Value');
if tap == 1
    t = 'tap,';
    t1 = 'Tap ';
elseif tap == 0
    t = '';

end
amp1 = '';
amplitude = get(handles.Amplitude, 'Value');
if amplitude == 1
    amp = 'amp,';
    amp1 = 'Amplitude';
    ampplug = ' --plugin amp@Amplitude';
elseif amplitude == 0
    amp ='';
    amp1='';
    ampplug = '';
end

custom = get(handles.Custom, 'String');
cmp = strcmp(custom, '0');
customout = '';
if cmp == 0
    customout = custom;
elseif cmp == 1
    customout = '';
end

%custom times
global cust

customtimes = get(handles.CustomTimes, 'Value');
duration = num2str(get(handles.Duration, 'String'));
times = num2str(get(handles.Times, 'String'));
trigchoice = get(get(handles.TrigChoice, 'SelectedObject'), 'String');
useprepost = get(handles.UsePrePost, 'Value');
pre = num2str(get(handles.Pre, 'String'));
post = num2str(get(handles.Post, 'String'));
cust = '';
trigtest = strcmp(trigchoice, 'Time');

if customtimes == 1 && trigtest == 1
    cust = [' --trigger ' duration ',' times];
end

if customtimes == 1 && trigtest == 0 && useprepost == 0
    cust = [' --trigger ' duration ',tap:: '];
end

if customtimes == 1 && trigtest == 0 && useprepost == 1
    cust = [' --trigger ' duration ',tap:' pre ':' post ' '];
end






%plugins
shad = '';
resp = '';
reout = '';
spinesfwd = '';
respined = get(handles.Respine, 'Value');
if respined == 1
    resp = ' --plugin Respine';
end
reoutlined = get(handles.Reoutline, 'Value');
if reoutlined == 1
    reout = ' --plugin Reoutline::exp::despike';
end
shadowless = get(handles.Shadowless, 'Value');
if shadowless == 1
    shad = ' --shadowless';
end

spinesforward = get(handles.SpinesForward, 'Value');
if spinesforward == 1
    spinesfwd = ' --plugin SpinesForward';
end

%Measure Reversals
measurerev = '';

usemeasurerev = get(handles.MeasureReversal, 'Value');
dt = num2str(get(handles.DT, 'String'));
idt = num2str(get(handles.IDT, 'String'));
revtrigger = get(handles.RevTrigger, 'Value');
collect = get(handles.Collect, 'Value');
bin = num2str(get(handles.BinSize, 'String'));
event = get(handles.Event, 'String');
hi = num2str(get(handles.Hi, 'String'));
low = num2str(get(handles.Low, 'String'));
histogram = '';
trigger ='';
scale= str2double(get(handles.scale, 'String'));
hibutton = get(handles.HiButton, 'Value');
lowbutton = get(handles.LowButton, 'Value');
smallnum = str2double(get(handles.TooSmall, 'String'));
toolittle = ((smallnum)/(1/scale));
toosmall = num2str(toolittle);
toobrief = get(handles.TooBrief, 'String');
if hibutton == 1
    hilow = ['+' hi];

elseif lowbutton == 1
    hilow = ['-' low];

end


if revtrigger == 1
    trigger = 'all';
elseif revtrigger == 2
    trigger = 'tap';
elseif trigger == 3
    trigger = [event hilow];
end

if usemeasurerev == 1
    measurerev = [' --plugin MeasureReversal::' trigger '::dt=' dt '::idt=' idt '::toobrief=' toobrief '::toosmall=' toosmall '::postfix=txt'];
end
if usemeasurerev == 1 && collect == 1
    histogram = ['::collect=' bin];
else
    histogram ='';
end
revoutput = [measurerev histogram];

%extract

useextract = get(handles.UseExtract, 'Value');
extspine = get(handles.Spine, 'Value');
extoutline = get(handles.Outline, 'Value');
extract = '';
if useextract == 1 && extspine == 1
    extract = ' --plugin Extract::spine';
end

if useextract == 1 && extoutline == 1
    extract = ' --plugin Extract::outline';
end


% Curvaceous
usecurvaceous = get(handles.UseCurvaceous, 'Value');
curvaceousscale = get(handles.CurvaceousScale, 'String');
interrupt = get(handles.Interrupt, 'String');
curvaceousout = '';

if str2double(curvaceousscale) ~= 0
    curvaceousscale = ['::' curvaceousscale];
elseif str2double(curvaceousscale) == 0
    curvaceousscale = '';
end

if str2double(interrupt) ~= 0
    interrupt = ['::' interrupt];
elseif str2double(interrupt) == 0
    interrupt = '';
end

if usecurvaceous == 1
    curvaceousout = [' --plugin cv@Curvaceous' curvaceousscale interrupt];
end


% EigenSpine
eigenchoice='';
eigengraphic ='';
eigendata = '';
passdata = '';
extraname = get(handles.SelectExtraData, 'UserData');
eignout = '';

useeigen = get(handles.UseEigenspine, 'Value');
if useeigen == 1
    eigenchoice = ' --plugin Eigenspine';
elseif useeigen == 0
    eigenchoice ='';
end


numpcs = get(handles.NumPCS, 'String');
if useeigen == 1
    pcs = ['::' numpcs];
end

generategraphic = get(handles.GenerateGraphic, 'Value')  ;
if generategraphic == 1
    eigengraphic ='::graphic';
end

extradata = get(handles.ExtraData, 'Value');
if extradata == 1
    eigendata ='::data';
elseif extradata == 0
    eigendata = '';
end


datause = get(handles.DataUse, 'Value');
if datause == 1
    passdata ='';
end

if datause == 2
    passdata = ['::vector=' extraname];
end

if datause == 3
    passdata = ['::extra=' extraname];

end


if useeigen == 1
    eigenout = [eigenchoice pcs eigengraphic eigendata passdata];
elseif useeigen == 0
    eigenout = '';
end


% Measure Omegas
omegaout = '';
measureomegas = get(handles.MeasureOmegas, 'Value');
if measureomegas == 1
    omegaout = ' --plugin MeasureOmega';
elseif measureomegas == 0
    omegaout = '';
end

usemultisense = get(handles.UseMultiSense, 'Value');
senseall = get(handles.SenseAll, 'Value');
senseomegas = get(handles.SenseOmegas, 'Value');
sensereversals = get(handles.SenseReversals, 'Value');
senseout = '';
senseo = '';
senser = '';

if senseomegas == 1
    senseo = 'o';
elseif senseomegas == 0
    senseo = '';
end

if sensereversals == 1
    senser = 'b';
elseif sensereversals == 0
    senser = '';
end


if usemultisense == 1 && senseall == 1
    senseout = ' --plugin MultiSensed::report';
else
    senseout ='';
end

if usemultisense == 1 && (senseomegas == 1 || sensereversals == 1)
    senseout = [' --plugin MultiSensed::report=' senseo senser ' '];
end




%individual outputs
individual = get(handles.IndividualOutputs, 'String');
test = strcmp(individual, '0');
individualoutputs = '';
if test == 0
    individualoutputs = [' -N' individual];
elseif test == 1
    individualoutputs = '';
end


global outputs
global home
global misc
global plugins
%global urcodeout
omegacustout = '';

omegacust = get(handles.MeasureOmegas, 'Value');
if omegacust == 1
    omegacustout = 'CC';
elseif omegacust == 0
    omegacustout = '';
end
version = get(handles.Version2, 'Value');
if version == 0
    home = ['java -Xmx1000m -jar C:\Users\Jeremy\Desktop\Tools\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\chore.jar ' foldername ' '];
elseif version == 1
    home = ['java -Xmx1000m -cp C:\Users\Jeremy\Desktop\Tools\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\scala-library.jar;C:\Users\Jeremy\Desktop\Tools\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\Chore.jar;C:\Users\Jeremy\Desktop\Tools\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\IchiMwt.jar;C:\Users\Jeremy\Desktop\Tools\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\commons-math3-3.1.1.jar Choreography ' foldername ];
end

outputs = [ampplug ' -o ' f D n N p e s S l L w W a A m M k b P c d x y u v o r t amp ];
outputs = [outputs(1:end-1) customout omegacustout];
outputs1 = { 'Time ', f1, D1, n1, N1, p1, e1, s1, S1, l1, L1, w1, W1, a1, A1, m1, M1, k1, b1, P1, c1, d1, x1, y1, u1, v1, o1, r1, t1, amp1};
misc = [rescaled speedwind dataspace mintime mindistance fwddist lengthunits disptype spec];
plugins = [shad ' -S' reout resp spinesfwd revoutput extract curvaceousout eigenout omegaout  senseout];
urcodeout = ['-S' misc, outputs plugins cust];
codeout = [home misc outputs plugins cust individualoutputs]
set(handles.codehome, 'String', codeout);
clipboard('copy', codeout);
setappdata(hObject, 'Codeout', codeout);

%   generate headers
listsize = numel(outputs1, ':', ':');
listcount = 1;
outputcount = 1;
outputheaders = {};
while listcount <= listsize
    s = size(outputs1{1, listcount});
    if s > 0
        outputheaders(1, outputcount) = outputs1(1, listcount);
        outputcount = outputcount +1;
        listcount = listcount + 1;
    else
        listcount = listcount + 1;
    end
    set(handles.DataTable, 'ColumnName', outputheaders);
end
setappdata(hObject, 'Outputs', outputheaders)
set(handles.OmegaTrace, 'UserData', outputs);
dos(codeout);





%import Dat
%global datpath
%datsearch = [foldername '\*.dat'];
%files = dir(datsearch);

%if exist(files.name, 'file')
%datpath = [foldername '\' files.name ];
%datfile = files.name;
%[name] = fileparts(datfile);
%newdat = [name 'dat' '.txt'];
%system(['rename ' datpath ' ' newdat]);

% find and import dat file
%txtsearch = [foldername '\*dat.txt'];
%txtfiles = dir(txtsearch);
%realdeal = [foldername '\' txtfiles.name];
%global dat

realdeal = char(FileSearch(foldername, '\*.dat'));
realdeal = realdeal(end, :);
freed = dlmread(realdeal, ' ');



%Setting plot and data table info
outend = numel(outputheaders, ':', ':');
set(handles.DataTable, 'Data', freed);
set(handles.DataTable, 'Data', freed);
set(handles.ChoosePlot, 'String', outputheaders(2:outend));
set(handles.DataTable, 'ColumnName', outputheaders);

%clean up

%system(['rename ' realdeal ' ' datfile]);
%set(handles.Custom, 'String', '0');



% --- Executes on button press in ImportDat.
function ImportDat_Callback(hObject, eventdata, handles)
% hObject    handle to ImportDat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
outputheaders = getappdata(handles.gobutton, 'Headers');
foldername = get(handles.SelectData, 'UserData');
ImportDat(foldername, outputheaders);


% --- Executes on button press in CustomTimes.
function CustomTimes_Callback(hObject, eventdata, handles)
% hObject    handle to CustomTimes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CustomTimes



function Duration_Callback(hObject, eventdata, handles)
% hObject    handle to Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Duration as text
%        str2double(get(hObject,'String')) returns contents of Duration as a double


% --- Executes during object creation, after setting all properties.
function Duration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Duration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Times_Callback(hObject, eventdata, handles)
% hObject    handle to Times (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Times as text
%        str2double(get(hObject,'String')) returns contents of Times as a double


% --- Executes during object creation, after setting all properties.
function Times_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Times (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






function Pre_Callback(hObject, eventdata, handles)
% hObject    handle to Pre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pre as text
%        str2double(get(hObject,'String')) returns contents of Pre as a double


% --- Executes during object creation, after setting all properties.
function Pre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Post_Callback(hObject, eventdata, handles)
% hObject    handle to Post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Post as text
%        str2double(get(hObject,'String')) returns contents of Post as a double


% --- Executes during object creation, after setting all properties.
function Post_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Post (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Event_Callback(hObject, eventdata, handles)
% hObject    handle to Event (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Event as text
%        str2double(get(hObject,'String')) returns contents of Event as a double


% --- Executes during object creation, after setting all properties.
function Event_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Event (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Hi_Callback(hObject, eventdata, handles)
% hObject    handle to Hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Hi as text
%        str2double(get(hObject,'String')) returns contents of Hi as a double


% --- Executes during object creation, after setting all properties.
function Hi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Low_Callback(hObject, eventdata, handles)
% hObject    handle to Low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Low as text
%        str2double(get(hObject,'String')) returns contents of Low as a double


% --- Executes during object creation, after setting all properties.
function Low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ImportTrig.
function ImportTrig_Callback(hObject, eventdata, handles)
% hObject    handle to ImportTrig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global foldername
global trigpath
trigsearch = [foldername '\*.trig'];
files = dir(trigsearch);

if exist(files.name, 'file')
    trigpath = [foldername '\' files.name ];
    trigfile = files.name;
    [pathstr, name, ext] = fileparts(trigfile);
    newtrig = [name 'trig' '.txt'];
    system(['rename ' trigpath ' ' newtrig]);
end

txtsearch = [foldername '\*trig.txt'];
txtfiles = dir(txtsearch);
trigdeal = [foldername '\' txtfiles.name];
global trig
trig = importdata(trigdeal, ' ');

% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes when selected cell(s) is changed in uitable2.
function uitable2_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PlotN.
function PlotN_Callback(hObject, eventdata, handles)
% hObject    handle to PlotN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PlotN
global dat
plotn = get(hObject, 'Value');
n = dat(:,2);
time = dat(:,1);
if plotn == 1
    plot(n);
end




% --- Executes on button press in PlotSpeed.
function PlotSpeed_Callback(hObject, eventdata, handles)
% hObject    handle to PlotSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PlotSpeed
global dat
plotspeed = get(hObject, 'Value');
speed = dat(:,3);
time = dat(:,1);
if plotspeed == 1
    plot(speed);
end

% --- Executes on button press in PlotKink.
function PlotKink_Callback(hObject, eventdata, handles)
% hObject    handle to PlotKink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PlotKink
global dat
plotkink = get(hObject, 'Value');
kink = dat(:,4);
time = dat(:,1);
if plotkink == 1
    plot(kink);
end

% --- Executes on button press in PlotCurvature.
function PlotCurvature_Callback(hObject, eventdata, handles)
% hObject    handle to PlotCurvature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PlotCurvature
global dat
plotcurvature = get(hObject, 'Value');
curvature = dat(:,5);
time = dat(:,1);
if plotcurvature == 1
    plot(curvature);
end


% --- Executes when selected cell(s) is changed in DataTable.
function DataTable_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to DataTable (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function DataTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DataTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in ProcessFolder.
function ProcessFolder_Callback(hObject, eventdata, handles)
% hObject    handle to ProcessFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f
global D
global n
global N
global p
global e
global s
global S
global l
global L
global w
global W
global a
global A
global m
global M
global k
global b
global P
global c
global d
global x
global y
global u
global v
global o
global r
global t



global f1
global D1
global n1
global N1
global p1
global e1
global s1
global S1
global l1
global L1
global w1
global W1
global a1
global A1
global m1
global M1
global k1
global b1
global P1
global c1
global d1
global x1
global y1
global u1
global v1
global o1
global r1
global t1

global foldername
%global urcodeout
specific = get(handles.SpecificTime, 'Value');
spdwin = '';
fwdbiasdist = '';
useautoscale = get(handles.AutoScale, 'Value');

if useautoscale == 1
    prescale = AutoScale(foldername)
    set(handles.scale, 'String', prescale)
elseif useautoscale == 0
    prescale = get(handles.scale, 'String');
end

mindistance =[' -M ', num2str(get(handles.MinDistance, 'String'))];
mintime = [' -t ', num2str(get(handles.MinTime, 'String'))];
dataspace = [' -T ', num2str(get(handles.DataSpacing, 'String'))];
speedwind = [' -s ', num2str(get(handles.SpeedWindow, 'String'))];
fwddist = [' --minimum-biased ' num2str(get(handles.FwdBiasDistance, 'String'))];
scaled = num2str(1/str2num(prescale));
rescaled = [' -p ' scaled];
from = num2str(get(handles.FromTime, 'String'));
to = num2str(get(handles.ToTime, 'String'));
spec = '';
if specific == 1
    spec = [' --from ' from ' --to ' to];
elseif specific == 0
    spec ='';
end

%pulldown menus



if specific == 1
    spec = [' --from ' from ' --to ' to];
elseif specific == 0
    spec ='';
end

%pulldown menus

velchoice = get(handles.VelocityUnits, 'Value');
dispchoice = get(handles.DisplayType, 'Value');
lengthunits = '';
disptype = '';

if velchoice == 1
    lengthunits = ' --body-length-units';
elseif velchoice == 0
    lengthunits = '';
end


if dispchoice == 1
    disptype = ' --map ';
elseif dispchoice == 2
    disptype = ' -I ';
end

%outputs
frame = get(handles.Frame, 'Value');
if frame == 1
    f = 'frame,';
    f1 = 'frame ';
elseif frame == 0
    f = '';

end
ID = get(handles.ID, 'Value');
if ID == 1
    D = 'id,';
    D1 = 'ID ';
elseif ID == 0
    D = '';

end
objects = get(handles.Objects, 'Value');
if objects == 1
    n = 'number,';
    n1 = 'Number ';
elseif objects == 0
    n = '';

end
goodobjects = get(handles.GoodObjects, 'Value');
if goodobjects == 1
    N = 'goodnumber,';
    N1 = 'Good Number ';
elseif goodobjects == 0
    N = '';

end
persistance = get(handles.Persistance, 'Value');
if persistance == 1
    p = 'persistence,';
    p1 = 'Persistence ';
elseif persistance == 0
    p = '';

end
area = get(handles.Area, 'Value');
if area == 1
    e = 'area,';
    e1 = 'Area ';
elseif area == 0
    e = '';

end
speed = get(handles.Speed, 'Value');
if speed == 1
    s = 'speed,';
    s1 = 'Speed ';
elseif speed == 0
    s = '';

end
angspeed = get(handles.AngularSpeed, 'Value');
if angspeed == 1
    S = 'angular,';
    S1 = 'Angular Velocity ';
elseif angspeed == 0
    S = '';

end
length = get(handles.Length, 'Value');
if length == 1
    l = 'length,';
    l1 = 'Length ';
elseif length == 0
    l = '';

end

rellength = get(handles.RelativeLength, 'Value');
if rellength == 1
    L = 'rellength,';
    L1 = 'Relative Length ';
elseif rellength == 0
    L = '';

end
width = get(handles.Width, 'Value');
if width == 1
    w = 'width,';
    w1 = 'Width ';
elseif width == 0
    w = '';

end
relwidth = get(handles.RelativeWidth, 'Value');
if relwidth == 1
    W = 'relwidth,';
    W1 = 'Relative Width ';
elseif relwidth == 0
    W = '';

end
aspect = get(handles.Aspect, 'Value');
if aspect == 1
    a = 'aspect,';
    a1 = 'Aspect ';
elseif aspect == 0
    a = '';

end
relaspect = get(handles.RelativeAspect, 'Value');
if relaspect == 1
    A = 'relaspect,';
    A1 = 'Relative Aspect ';
elseif relaspect == 0
    A = '';

end
midlength = get(handles.MidlineLength, 'Value');
if midlength == 1
    m = 'midline,';
    m1 = 'Midline Length ';
elseif midlength == 0
    m = '';

end
midwidth = get(handles.MidlineWidth, 'Value');
if midwidth == 1
    M = 'morphwidth,';
    M1 = 'Midline Width ';
elseif midwidth == 0
    M = '';

end
kink = get(handles.Kink, 'Value');
if kink == 1
    k = 'kink,';
    k1 = 'Kink ';
elseif kink == 0
    k = '';

end
bias = get(handles.Bias, 'Value');
if bias == 1
    b = 'bias,';
    b1 = 'Bias ';
elseif bias == 0
    b = '';

end
pathlength = get(handles.PathLength, 'Value');
if pathlength == 1
    P = 'pathlen,';
    P1 = 'Pathlength ';
elseif pathlength == 0
    P = '';

end
curve = get(handles.Curvature, 'Value');
if curve == 1
    c = 'curve,';
    c1 = 'Curvature ';
elseif curve == 0
    c = '';

end
direction = get(handles.DirectionalConstancy, 'Value');
if direction == 1
    d = 'dir,';
    d1 = 'Directional Constancy ';
elseif direction == 0
    d = '';

end
lox = get(handles.LocX, 'Value');
if lox == 1
    x = 'loc_x,';
    x1 = 'X location ';
elseif lox == 0
    x = '';

end
loy = get(handles.LocY, 'Value');
if loy == 1
    y = 'loc_y,';
    y1 = 'Y Location ';
elseif loy == 0
    y = '';

end
vex = get(handles.VelX, 'Value');
if vex == 1
    u = 'vel_x,';
    u1 = 'X Velocity ';
elseif vex == 0
    u = '';

end
vey = get(handles.VelY, 'Value');
if vey == 1
    v = 'vel_y,';
    v1 = 'Y Velocity ';
elseif vey == 0
    v = '';

end
orientation = get(handles.Orientation, 'Value');
if orientation == 1
    o = 'orient,';
    o1 = 'Orientation ';
elseif orientation == 0
    o = '';

end
crab = get(handles.Crab, 'Value');
if crab == 1
    r = 'crab,';
    r1 = 'Crab ';
elseif crab == 0
    r = '';

end
tap = get(handles.Tap, 'Value');
if tap == 1
    t = 'tap,';
    t1 = 'Tap ';
elseif tap == 0
    t = '';

end

amplitude = get(handles.Amplitude, 'Value');
if amplitude == 1
    amp = 'amp,';
    amp1 = 'Amplitude';
    ampplug = ' --plugin amp@Amplitude';
elseif amplitude == 0
    amp ='';
    amp1= '';
    ampplug = '';
end

custom = get(handles.Custom, 'String');
cmp = strcmp(custom, '0');
customout = '';
if cmp == 0
    customout = custom;
elseif cmp == 1
    customout = '';
end

%custom times
global cust
customtimes = get(handles.CustomTimes, 'Value');
duration = num2str(get(handles.Duration, 'String'));
times = num2str(get(handles.Times, 'String'));
trigchoice = get(get(handles.TrigChoice, 'SelectedObject'), 'String');
useprepost = get(handles.UsePrePost, 'Value');
pre = num2str(get(handles.Pre, 'String'));
post = num2str(get(handles.Post, 'String'));
cust = '';
trigtest = strcmp(trigchoice, 'Time');

if customtimes == 1 && trigtest == 1
    cust = [' --trigger ' duration ',' times];
end

if customtimes == 1 && trigtest == 0 && useprepost == 0
    cust = [' --trigger ' duration ',tap:: '];
end

if customtimes == 1 && trigtest == 0 && useprepost == 1
    cust = [' --trigger ' duration ',tap:' pre ':' post ' '];
end




%plugins
shad = '';
resp = '';
reout = '';
spinesfwd = '';
respined = get(handles.Respine, 'Value');
if respined == 1
    resp = ' --plugin Respine';
end
reoutlined = get(handles.Reoutline, 'Value');
if reoutlined == 1
    reout = ' --plugin Reoutline::exp::despike';
end
shadowless = get(handles.Shadowless, 'Value');
if shadowless == 1
    shad = ' --shadowless';
end

spinesforward = get(handles.SpinesForward, 'Value');
if spinesforward == 1
    spinesfwd = ' --plugin SpinesForward';
end

%Measure Reversals
measurerev = '';

usemeasurerev = get(handles.MeasureReversal, 'Value');
dt = num2str(get(handles.DT, 'String'));
idt = num2str(get(handles.IDT, 'String'));
revtrigger = get(handles.RevTrigger, 'Value');
collect = get(handles.Collect, 'Value');
bin = num2str(get(handles.BinSize, 'String'));
event = get(handles.Event, 'String');
hi = num2str(get(handles.Hi, 'String'));
low = num2str(get(handles.Low, 'String'));
histogram = '';
trigger ='';
scale= str2double(get(handles.scale, 'String'));
hibutton = get(handles.HiButton, 'Value');
lowbutton = get(handles.LowButton, 'Value');
smallnum = str2double(get(handles.TooSmall, 'String'));
toolittle = ((smallnum)/(1/scale));
toosmall = num2str(toolittle);
toobrief = get(handles.TooBrief, 'String');
if hibutton == 1
    hilow = ['+' hi];

elseif lowbutton == 1
    hilow = ['-' low];

end


if revtrigger == 1
    trigger = 'all';
elseif revtrigger == 2
    trigger = 'tap';
elseif trigger == 3
    trigger = [event hilow];
end

if usemeasurerev == 1
    measurerev = [' --plugin MeasureReversal::' trigger '::dt=' dt '::idt=' idt '::toobrief=' toobrief '::toosmall=' toosmall '::postfix=txt'];
end
if usemeasurerev == 1 && collect == 1
    histogram = ['::collect=' bin];
else
    histogram ='';
end
revoutput = [measurerev histogram];

%extract

useextract = get(handles.UseExtract, 'Value');
extspine = get(handles.Spine, 'Value');
extoutline = get(handles.Outline, 'Value');
extract = '';
if useextract == 1 && extspine == 1
    extract = ' --plugin Extract::spine';
end

if useextract == 1 && extoutline == 1
    extract = ' --plugin Extract::outline';
end


% Curvaceous
usecurvaceous = get(handles.UseCurvaceous, 'Value');
curvaceousscale = get(handles.CurvaceousScale, 'String');
interrupt = get(handles.Interrupt, 'String');
curvaceousout = '';

if str2double(curvaceousscale) ~= 0
    curvaceousscale = ['::' curvaceousscale];
elseif curvaceousscale == 0
    curvaceousscale = '';
end

if str2double(interrupt) ~= 0
    interrupt = ['::' interrupt];
elseif interrupt == 0
    interrupt = '';
end

if usecurvaceous == 1
    curvaceousout = [' --plugin cv@Curvaceous' curvaceousscale interrupt];
end


% EigenSpine
eigenchoice='';
eigengraphic ='';
eigendata = '';
passdata = '';
extraname = get(handles.SelectExtraData, 'UserData');
eignout = '';

useeigen = get(handles.UseEigenspine, 'Value');
if useeigen == 1
    eigenchoice = ' --plugin Eigenspine';
elseif useeigen == 0
    eigenchoice ='';
end


numpcs = get(handles.NumPCS, 'String');
if useeigen == 1
    pcs = ['::' numpcs];
end

generategraphic = get(handles.GenerateGraphic, 'Value')  ;
if generategraphic == 1
    eigengraphic ='::graphic';
end

extradata = get(handles.ExtraData, 'Value');
if extradata == 1
    eigendata ='::data';
elseif extradata == 0
    eigendata = '';
end


datause = get(handles.DataUse, 'Value');
if datause == 1
    passdata ='';
end

if datause == 2
    passdata = ['::vector=' extraname];
end

if datause == 3
    passdata = ['::extra=' extraname];

end


if useeigen == 1
    eigenout = [eigenchoice pcs eigengraphic eigendata passdata];
elseif useeigen == 0
    eigenout = '';
end


% Measure Omegas
omegaout = '';
measureomegas = get(handles.MeasureOmegas, 'Value');
if measureomegas == 1
    omegaout = ' --plugin MeasureOmega';
elseif measureomegas == 0
    omegaout = '';
end

usemultisense = get(handles.UseMultiSense, 'Value');
senseall = get(handles.SenseAll, 'Value');
senseomegas = get(handles.SenseOmegas, 'Value');
sensereversals = get(handles.SenseReversals, 'Value');
senseout = '';
senseo = '';
senser = '';

if senseomegas == 1
    senseo = 'o';
elseif senseomegas == 0
    senseo = '';
end

if sensereversals == 1
    senser = 'b';
elseif sensereversals == 0
    senser = '';
end


if usemultisense == 1 && senseall == 1
    senseout = ' --plugin MultiSensed::report';
else
    senseout ='';
end

if usemultisense == 1 && (senseomegas == 1 || sensereversals == 1)
    senseout = [' --plugin MultiSensed::report=' senseo senser ' '];
end




%individual outputs
individual = get(handles.IndividualOutputs, 'String');
test = strcmp(individual, '0');
individualoutputs = '';
if test == 0
    individualoutputs = [' -N' individual];
elseif test == 1
    individualoutputs = '';
end


omegacustout = '';

omegacust = get(handles.MeasureOmegas, 'Value');
if omegacust == 1
    omegacustout = 'CC';
elseif omegacust == 0
    omegacustout = '';
end
version = get(handles.Version2, 'Value');
if version == 0
    home = ['java -Xmx1000m -jar C:\Users\Jeremy\Desktop\Tools\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\chore.jar '];
elseif version == 1
    home = ['java -Xmx1000m -cp C:\Users\Jeremy\Desktop\Tools\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\scala-library.jar;C:\Users\Jeremy\Desktop\Tools\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\Chore.jar;C:\Users\Jeremy\Desktop\Tools\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\IchiMwt.jar;C:\Users\Jeremy\Desktop\Tools\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\commons-math3-3.1.1.jar Choreography ' ];
end




outputs = [ampplug ' -o ' f D n N p e s S l L w W a A m M k b P c d x y u v o r t amp ];
outputs = [outputs(1:end-1) customout omegacustout];
outputs1 = { 'Time ', f1, D1, n1, N1, p1, e1, s1, S1, l1, L1, w1, W1, a1, A1, m1, M1, k1, b1, P1, c1, d1, x1, y1, u1, v1, o1, r1, t1, amp1};
misc = [rescaled speedwind dataspace mintime mindistance fwddist lengthunits spec];
plugins = [shad ' -S' reout resp spinesfwd revoutput extract curvaceousout eigenout omegaout  senseout];
urcodeout = ['-S' misc, outputs plugins cust];

tempfolder = '';
folderhome = [home foldername '\'];
urcodeout = [' -S' misc, outputs plugins cust individualoutputs];
foldercontents = dir(foldername);
subfolders = {foldercontents.name};
last = numel(subfolders, ':', ':');

count = 2;
while  count<=last
    tempfolder = subfolders(1, count);
    outfold = char(tempfolder);
    processoutput = [folderhome outfold urcodeout]
    dos(processoutput)
    count = count + 1;
end
index = 1;
for i = 1:30
    temp = isempty(outputs1{i});
    if temp == 0
        outputheaders(index) = {outputs1{i}};
        index = index +1;
    end
end
set(handles.codehome, 'String', processoutput);
setappdata(hObject, 'Headers', outputheaders);




% --- Executes on selection change in ChoosePlot.
function ChoosePlot_Callback(hObject, eventdata, handles)
% hObject    handle to ChoosePlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ChoosePlot contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ChoosePlot




% --- Executes during object creation, after setting all properties.
function ChoosePlot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChoosePlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in PlotButton.
function PlotButton_Callback(hObject, eventdata, handles)
% hObject    handle to PlotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tablecontents = get(handles.DataTable, 'Data');
headers = get(handles.DataTable, 'ColumnName');
set(handles.ChoosePlot, 'String', headers(2:end, 1));
plotselection = get(handles.ChoosePlot, 'Value');

choicelist = cellstr(get(handles.ChoosePlot, 'String'));
titleindex = char(choicelist(plotselection, 1));

plottime = tablecontents(:,1);
toplot = tablecontents(:, (plotselection + 1));

plot(plottime,toplot);
set(handles.PlotTitle, 'String', titleindex);


% --- Executes during object creation, after setting all properties.
function PlotTitle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlotTitle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in ImportReversals.
function ImportReversals_Callback(hObject, eventdata, handles)
% hObject    handle to ImportReversals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
ImportReversals(foldername)






% --- Executes during object creation, after setting all properties.
function scale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BatchImportReversals.
function BatchImportReversals_Callback(hObject, eventdata, handles)
% hObject    handle to BatchImportReversals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
BatchImportRev(foldername);


% --- Executes on button press in UseExtract.
function UseExtract_Callback(hObject, eventdata, handles)
% hObject    handle to UseExtract (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of UseExtract


% --- Executes on button press in UseCurvaceous.
function UseCurvaceous_Callback(hObject, eventdata, handles)
% hObject    handle to UseCurvaceous (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of UseCurvaceous



function CurvaceousScale_Callback(hObject, eventdata, handles)
% hObject    handle to CurvaceousScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CurvaceousScale as text
%        str2double(get(hObject,'String')) returns contents of CurvaceousScale as a double


% --- Executes during object creation, after setting all properties.
function CurvaceousScale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CurvaceousScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Interrupt_Callback(hObject, eventdata, handles)
% hObject    handle to Interrupt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Interrupt as text
%        str2double(get(hObject,'String')) returns contents of Interrupt as a double


% --- Executes during object creation, after setting all properties.
function Interrupt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Interrupt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IndividualOutputs_Callback(hObject, eventdata, handles)
% hObject    handle to IndividualOutputs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IndividualOutputs as text
%        str2double(get(hObject,'String')) returns contents of IndividualOutputs as a double


% --- Executes during object creation, after setting all properties.
function IndividualOutputs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IndividualOutputs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in UseEigenspine.
function UseEigenspine_Callback(hObject, eventdata, handles)
% hObject    handle to UseEigenspine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of UseEigenspine


% --- Executes on button press in GenerateGraphic.
function GenerateGraphic_Callback(hObject, eventdata, handles)
% hObject    handle to GenerateGraphic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of GenerateGraphic


% --- Executes on button press in ExtraData.
function ExtraData_Callback(hObject, eventdata, handles)
% hObject    handle to ExtraData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ExtraData



function NumPCS_Callback(hObject, eventdata, handles)
% hObject    handle to NumPCS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumPCS as text
%        str2double(get(hObject,'String')) returns contents of NumPCS as a double


% --- Executes during object creation, after setting all properties.
function NumPCS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumPCS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SelectExtraData.
function SelectExtraData_Callback(hObject, eventdata, handles)
% hObject    handle to SelectExtraData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
extraname=uigetfile('*.eigen', 'wheres ya data chump?', foldername)
set(hObject, 'UserData', extraname);

% --- Executes on selection change in DataUse.
function DataUse_Callback(hObject, eventdata, handles)
% hObject    handle to DataUse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DataUse contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DataUse


% --- Executes during object creation, after setting all properties.
function DataUse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DataUse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MeasureOmegas.
function MeasureOmegas_Callback(hObject, eventdata, handles)
% hObject    handle to MeasureOmegas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MeasureOmegas


% --- Executes on button press in CollectedRev.
function CollectedRev_Callback(hObject, eventdata, handles)
% hObject    handle to CollectedRev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
BatchImportCollect(foldername);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over VelocityUnits.
function VelocityUnits_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to VelocityUnits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in SpinesForward.
function SpinesForward_Callback(hObject, eventdata, handles)
% hObject    handle to SpinesForward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SpinesForward


% --- Executes on button press in ProcessStarvation.
function ProcessStarvation_Callback(hObject, eventdata, handles)
% hObject    handle to ProcessStarvation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
SpontaneousRevCollect(foldername);


% --- Executes on button press in GetIDs.
function GetIDs_Callback(hObject, eventdata, handles)
% hObject    handle to GetIDs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
idlist = GetIDs(foldername);
set(hObject, 'UserData', idlist);
set(handles.IndividualOutputs, 'String', idlist);
set(handles.gobutton, 'Value', 1);


% --- Executes on button press in GetTraces.
function GetTraces_Callback(hObject, eventdata, handles)
% hObject    handle to GetTraces (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
timepre = str2double(get(handles.TracePre,'String'));
timepost = str2double(get(handles.TracePost,'String'));
[longrev]= MasterTrace(foldername,timepre, timepost);
set(handles.IndividualOutputs, 'String', '0');
setappdata(hObject, 'NormalizedReversals', longrev);
plot(longrev);
axis('auto');


function TracePre_Callback(hObject, eventdata, handles)
% hObject    handle to TracePre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TracePre as text
%        str2double(get(hObject,'String')) returns contents of TracePre as a double


% --- Executes during object creation, after setting all properties.
function TracePre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TracePre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TracePost_Callback(hObject, eventdata, handles)
% hObject    handle to TracePost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TracePost as text
%        str2double(get(hObject,'String')) returns contents of TracePost as a double


% --- Executes during object creation, after setting all properties.
function TracePost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TracePost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DeleteTxt.
function DeleteTxt_Callback(hObject, eventdata, handles)
% hObject    handle to DeleteTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
searchterm = '\*.txt';
DeleteTxt(foldername, searchterm);

% --- Executes on button press in BatchDeleteTxt.
function BatchDeleteTxt_Callback(hObject, eventdata, handles)
% hObject    handle to BatchDeleteTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
searchterm = '\*.txt';
BatchDeleteTxt(foldername, searchterm);



% --- Executes on button press in DeleteDat.
function DeleteDat_Callback(hObject, eventdata, handles)
% hObject    handle to DeleteDat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
searchterm = '\*.dat';
DeleteTxt(foldername, searchterm);

% --- Executes on button press in BatchDeleteDat.
function BatchDeleteDat_Callback(hObject, eventdata, handles)
% hObject    handle to BatchDeleteDat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
searchterm = '\*.dat';
BatchDeleteTxt(foldername, searchterm);


% --- Executes on button press in DeleteZeros.
function DeleteZeros_Callback(hObject, eventdata, handles)
% hObject    handle to DeleteZeros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
DeleteZeros(foldername);


% --- Executes on button press in Version2.
function Version2_Callback(hObject, eventdata, handles)
% hObject    handle to Version2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Version2


% --- Executes on button press in UseMultiSense.
function UseMultiSense_Callback(hObject, eventdata, handles)
% hObject    handle to UseMultiSense (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of UseMultiSense


% --- Executes on button press in SenseAll.
function SenseAll_Callback(hObject, eventdata, handles)
% hObject    handle to SenseAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SenseAll


% --- Executes on button press in SenseOmegas.
function SenseOmegas_Callback(hObject, eventdata, handles)
% hObject    handle to SenseOmegas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SenseOmegas


% --- Executes on button press in SenseReversals.
function SenseReversals_Callback(hObject, eventdata, handles)
% hObject    handle to SenseReversals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SenseReversals


% --- Executes on button press in Amplitude.
function Amplitude_Callback(hObject, eventdata, handles)
% hObject    handle to Amplitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Amplitude


% --- Executes on button press in UsePrePost.
function UsePrePost_Callback(hObject, eventdata, handles)
% hObject    handle to UsePrePost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of UsePrePost


% --- Executes when selected object is changed in TrigChoice.
function TrigChoice_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in TrigChoice
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ReadMultisense.
function ReadMultisense_Callback(hObject, eventdata, handles)
% hObject    handle to ReadMultisense (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
report = ReadMultiSense(foldername);
set(hObject, 'UserData', report);


% --- Executes on button press in BatchMultisense.
function BatchMultisense_Callback(hObject, eventdata, handles)
% hObject    handle to BatchMultisense (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
BatchMultiSense(foldername);


% --- Executes on button press in ReadRpt.
function ReadRpt_Callback(hObject, eventdata, handles)
% hObject    handle to ReadRpt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
ReadRPT(foldername);

% --- Executes on button press in BatchRpt.
function BatchRpt_Callback(hObject, eventdata, handles)
% hObject    handle to BatchRpt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
BatchReadRPT(foldername);


% --- Executes on button press in BatchDat.
function BatchDat_Callback(hObject, eventdata, handles)
% hObject    handle to BatchDat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
outputheaders = getappdata(handles.ProcessFolder, 'Headers');
foldername = get(handles.SelectData, 'UserData');
BatchDat(foldername, outputheaders);


% --- Executes on button press in BatchTraces.
function BatchTraces_Callback(hObject, eventdata, handles)
% hObject    handle to BatchTraces (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)foldername = get(handles.SelectData, 'UserData');
foldername = get(handles.SelectData, 'UserData');
timepre = str2double(get(handles.TracePre,'String'));
timepost = str2double(get(handles.TracePost,'String'));
[longrev]= BatchTraces(foldername,timepre, timepost);
set(handles.IndividualOutputs, 'String', '0');
setappdata(hObject, 'BatchReversals', longrev);
plot(longrev);
axis('auto');


% --- Executes on selection change in Align.
function Align_Callback(hObject, eventdata, handles)
% hObject    handle to Align (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Align contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Align


% --- Executes during object creation, after setting all properties.
function Align_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Align (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OmegaTrace.
function OmegaTrace_Callback(hObject, eventdata, handles)
% hObject    handle to OmegaTrace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
omgpre = str2double(get(handles.OmgPre,'String'));
omgpost = str2double(get(handles.OmgPost,'String'));
align = get(handles.Align, 'Value');
codeout = get(handles.codehome, 'String');
reprocess = get(handles.Reprocess, 'Value');
outputs = get(hObject, 'UserData');
print = 1;

[somrev] = OmegaTrace(foldername,codeout,outputs, align, omgpre, omgpost, reprocess, print);


function OmgPre_Callback(hObject, eventdata, handles)
% hObject    handle to OmgPre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OmgPre as text
%        str2double(get(hObject,'String')) returns contents of OmgPre as a double


% --- Executes during object creation, after setting all properties.
function OmgPre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OmgPre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OmgPost_Callback(hObject, eventdata, handles)
% hObject    handle to OmgPre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OmgPre as text
%        str2double(get(hObject,'String')) returns contents of OmgPre as a double


% --- Executes during object creation, after setting all properties.
function OmgPost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OmgPre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Reprocess.
function Reprocess_Callback(hObject, eventdata, handles)
% hObject    handle to Reprocess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Reprocess


%function BatchMultisense_Callback(hObject, eventdata, handles)
% hObject    handle to BatchMultisense (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%disp('multisense')
%parentfolder = get(handles.SelectData, 'UserData');
%omgpre = str2double(get(handles.OmgPre,'String'));
%omgpost = str2double(get(handles.OmgPost,'String'));
%align = get(handles.Align, 'Value');
%codeout = get(handles.codehome, 'String');
%reprocess = get(handles.Reprocess, 'Value');
%outputs = get(hObject, 'UserData');
% BatchOmegaTrace(parentfolder,codeout,outputs, align, omgpre, omgpost, reprocess);


% --- Executes on button press in AutoScale.
function AutoScale_Callback(hObject, eventdata, handles)
% hObject    handle to AutoScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AutoScale



% --- Executes on button press in WormCruncher.
function WormCruncher_Callback(hObject, eventdata, handles)
% hObject    handle to WormCruncher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
parentfolder = get(handles.SelectData, 'UserData');
MegaBatch(parentfolder,0)


% --- Executes on button press in AutoProcess.
function AutoProcess_Callback(hObject, eventdata, handles)
% hObject    handle to AutoProcess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
codeout = getappdata(handles.gobutton, 'Codeout');
AutoProcess(foldername, codeout);


% --- Executes on button press in BatchDeleteTrig.
function BatchDeleteTrig_Callback(hObject, eventdata, handles)
% hObject    handle to BatchDeleteTrig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
searchterm = '\*.trig';
BatchDeleteTxt(foldername, searchterm);


% --- Executes on button press in AutoTrig.
function AutoTrig_Callback(hObject, eventdata, handles)
% hObject    handle to AutoTrig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
%outputheaders = getappdata(handles.gobutton, 'Outputs');
%numcol = numel(outputheaders, ':', ':')
codeout = get(handles.codehome, 'String');
AutoTrig(foldername,codeout);


% --- Executes on button press in AutoTrp.
function AutoTrp_Callback(hObject, eventdata, handles)
% hObject    handle to AutoTrp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
codeout = get(handles.codehome, 'String');
AutoTrp(foldername,codeout)


% --- Executes on button press in AutoDeleteAll.
function AutoDeleteAll_Callback(hObject, eventdata, handles)
% hObject    handle to AutoDeleteAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
AutoDeleteAll(foldername)


% --- Executes on button press in eigenkymo.
function eigenkymo_Callback(hObject, eventdata, handles)
% hObject    handle to eigenkymo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
filename = FileSearch(foldername, '\*.data');
EigenKymo(filename)


% --- Executes on button press in dwell2roam.
function dwell2roam_Callback(hObject, eventdata, handles)
% hObject    handle to dwell2roam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%velchoice = get(handles.VelocityUnits, 'Value');
foldername = get(handles.SelectData, 'UserData');
%codeout = get(handles.codehome, 'String');
Dwell2Roam(foldername)


% --- Executes on button press in batchdwell2roam.
function batchdwell2roam_Callback(hObject, eventdata, handles)
% hObject    handle to batchdwell2roam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
velchoice = get(handles.VelocityUnits, 'Value');
foldername = get(handles.SelectData, 'UserData');
codeout = get(handles.codehome, 'String');
print = 1;
BatchDwell2Roam(foldername,codeout, velchoice, print)


% --- Executes on button press in groupdwell2roam.
function groupdwell2roam_Callback(hObject, eventdata, handles)
% hObject    handle to groupdwell2roam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)velchoice = get(handles.VelocityUnits, 'Value');
foldername = get(handles.SelectData, 'UserData');
codeout = get(handles.codehome, 'String');
units = get(handles.VelocityUnits, 'Value');
print = 1;
GroupDwell2Roam(foldername, codeout, units)


% --- Executes on button press in metaprocess.
function metaprocess_Callback(hObject, eventdata, handles)
% hObject    handle to metaprocess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
codeout = get(handles.codehome, 'String');
MetaProcess(foldername, codeout)


% --- Executes on button press in batchomegatrace.
function batchomegatrace_Callback(hObject, eventdata, handles)
% hObject    handle to batchomegatrace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
omgpre = str2double(get(handles.OmgPre,'String'));
omgpost = str2double(get(handles.OmgPost,'String'));
align = get(handles.Align, 'Value');
codeout = get(handles.codehome, 'String');
reprocess = get(handles.Reprocess, 'Value');
outputs = get(hObject, 'UserData');

BatchOmegaTrace(foldername,codeout,outputs, align, omgpre, omgpost, reprocess);


% --- Executes on button press in automegatrace.
function automegatrace_Callback(hObject, eventdata, handles)
% hObject    handle to automegatrace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
omgpre = str2double(get(handles.OmgPre,'String'));
omgpost = str2double(get(handles.OmgPost,'String'));
align = get(handles.Align, 'Value');
codeout = get(handles.codehome, 'String');
reprocess = get(handles.Reprocess, 'Value');
outputs = get(hObject, 'UserData');

AutOmegaTrace(foldername,codeout,outputs, align, omgpre, omgpost, reprocess);


% --- Executes on button press in plottracks.
function plottracks_Callback(hObject, eventdata, handles)
% hObject    handle to plottracks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData,'UserData');
PlotTracks(foldername);


% --- Executes on button press in batchdeletespine.
function batchdeletespine_Callback(hObject, eventdata, handles)
% hObject    handle to batchdeletespine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
searchterm = '\*.spine';
BatchDeleteTxt(foldername, searchterm);


% --- Executes on button press in autosplit.
function autosplit_Callback(hObject, eventdata, handles)
% hObject    handle to autosplit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
codeout = get(handles.codehome, 'String');
AutoSplit(foldername, codeout);


% --- Executes on button press in splitprocess.
function splitprocess_Callback(hObject, eventdata, handles)
% hObject    handle to splitprocess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
codeout = get(handles.codehome, 'String');
SplitSingle(foldername, codeout);


% --- Executes on button press in removejitter.
function removejitter_Callback(hObject, eventdata, handles)
% hObject    handle to removejitter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
codeout = get(handles.codehome, 'String');
RemoveJitter(foldername, codeout);


% --- Executes during object creation, after setting all properties.
function Folderlevel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Folderlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function HistBins_Callback(hObject, eventdata, handles)
% hObject    handle to HistBins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HistBins as text
%        str2double(get(hObject,'String')) returns contents of HistBins as a double


% --- Executes during object creation, after setting all properties.
function HistBins_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HistBins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in HistMeta.
function HistMeta_Callback(hObject, eventdata, handles)
% hObject    handle to HistMeta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HistMeta


% --- Executes during object creation, after setting all properties.
function HistF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HistF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function HistR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HistR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function HistS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HistS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function HistO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HistO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in GetHist.
function GetHist_Callback(hObject, eventdata, handles)
% hObject    handle to GetHist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
histbins = str2double(get(handles.HistBins, 'String'));
usesingle = get(handles.HistSingle, 'Value');
usebatch = get(handles.HistBatch, 'Value');
useauto = get(handles.HistAuto, 'Value');
usemeta = get(handles.HistMeta, 'Value');

histf = get(handles.HistF, 'Value');
histr = get(handles.HistR, 'Value');
hists = get(handles.HistS, 'Value');
histo = get(handles.HistO, 'Value');

yaxlim = get(handles.YAxLimit, 'String');

action = '';
if histf == 1
    action = 'Forward';
elseif histr == 1
    action = 'Reversal';
elseif hists == 1
    action = 'Stop';
elseif histo == 1
    action = 'Omega';
end


if usesingle == 1
    Reversal_Histogram(foldername, histbins, action,yaxlim)
elseif usebatch == 1
    Batch_Reversal_Histogram(foldername, histbins, action, yaxlim)
elseif useauto == 1
    Auto_Reversal_Histogram(foldername, histbins, action, yaxlim)
elseif usemeta == 1
    Meta_Reversal_Histogram(foldername, histbins, action, yaxlim)
end



function YAxLimit_Callback(hObject, eventdata, handles)
% hObject    handle to YAxLimit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YAxLimit as text
%        str2double(get(hObject,'String')) returns contents of YAxLimit as a double


% --- Executes during object creation, after setting all properties.
function YAxLimit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YAxLimit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frminduration_Callback(hObject, eventdata, handles)
% hObject    handle to frminduration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frminduration as text
%        str2double(get(hObject,'String')) returns contents of frminduration as a double


% --- Executes during object creation, after setting all properties.
function frminduration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frminduration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frwindow_Callback(hObject, eventdata, handles)
% hObject    handle to frwindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frwindow as text
%        str2double(get(hObject,'String')) returns contents of frwindow as a double


% --- Executes during object creation, after setting all properties.
function frwindow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frwindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frtaptime_Callback(hObject, eventdata, handles)
% hObject    handle to frtaptime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frtaptime as text
%        str2double(get(hObject,'String')) returns contents of frtaptime as a double


% --- Executes during object creation, after setting all properties.
function frtaptime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frtaptime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in firstresponse.
function firstresponse_Callback(hObject, eventdata, handles)
% hObject    handle to firstresponse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
usesingle = get(handles.HistSingle, 'Value');
usebatch = get(handles.HistBatch, 'Value');
useauto = get(handles.HistAuto, 'Value');
usemeta = get(handles.HistMeta, 'Value');
taptime = str2double(get(handles.frtaptime, 'String'));
window = str2double(get(handles.frwindow, 'String'));
tooshort = str2double(get(handles.frminduration, 'String'));
write = get(handles.frwrite, 'Value');



if usesingle == 1
    [output] = FirstResponse(foldername,taptime,window, tooshort);
elseif usebatch == 1
    [output] = BatchFirstResponse(foldername,taptime,window, write, tooshort);
elseif useauto == 1
    [output] = AutoFirstResponse(foldername,taptime,window, write, tooshort);
elseif usemeta == 1
    Meta_Reversal_Histogram(foldername, histbins, action, yaxlim)
end


% --- Executes on button press in frwrite.
function frwrite_Callback(hObject, eventdata, handles)
% hObject    handle to frwrite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of frwrite


% --- Executes on button press in signedvelocity.
function signedvelocity_Callback(hObject, eventdata, handles)
% hObject    handle to signedvelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
mintime = 200;
maxtime = 400;
SignedVelocity(foldername, mintime, maxtime)


% --- Executes on button press in batchsignedvelocity.
function batchsignedvelocity_Callback(hObject, eventdata, handles)
% hObject    handle to batchsignedvelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
mintime = 200;
maxtime = 400;
BatchSignedVel(foldername, mintime, maxtime)


% --- Executes on button press in gettrig.
function gettrig_Callback(hObject, eventdata, handles)
% hObject    handle to gettrig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
usesingle = get(handles.HistSingle, 'Value');
usebatch = get(handles.HistBatch, 'Value');
useauto = get(handles.HistAuto, 'Value');
usemeta = get(handles.HistMeta, 'Value');
dt = get(handles.Duration, 'String');
times = get(handles.Times, 'String');
codeout = get(handles.codehome, 'String');


if usesingle == 1
    [output] = CustomTrig(foldername,dt,times, codeout);
elseif usebatch == 1
    [output] = BatchCustomTrig(foldername,dt,times, codeout);
elseif useauto == 1
    [output] = AutoCustomTrig(foldername,dt,times, codeout);
elseif usemeta == 1
    [output] = MetaCustomTrig(foldername,dt,times, codeout);
end


% --- Executes on button press in flux.
function flux_Callback(hObject, eventdata, handles)
% hObject    handle to flux (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
numCircles = str2double(get(handles.numcircles, 'String'));
window = num2str(get(handles.SpeedWindow, 'String'));
minlength = num2str(get(handles.MinDistance, 'String'));
mindur = num2str(get(handles.MinTime, 'String'));
samplerate = num2str(get(handles.DataSpacing, 'String'));
outputs = get(handles.outtype, 'String');
outval = get(handles.outtype, 'Value');

output = outputs{outval};

fwdbias = [' --minimum-biased ' num2str(get(handles.FwdBiasDistance, 'String'))];

FluxCode(foldername,numCircles,window,minlength,mindur,samplerate,fwdbias,output)


function numcircles_Callback(hObject, eventdata, handles)
% hObject    handle to numcircles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numcircles as text
%        str2double(get(hObject,'String')) returns contents of numcircles as a double


% --- Executes during object creation, after setting all properties.
function numcircles_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numcircles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in outtype.
function outtype_Callback(hObject, eventdata, handles)
% hObject    handle to outtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns outtype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from outtype


% --- Executes during object creation, after setting all properties.
function outtype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in densitysingle.
function densitysingle_Callback(hObject, eventdata, handles)
% hObject    handle to densitysingle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
densityPlot(foldername);



% --- Executes on button press in batchdensity.
function batchdensity_Callback(hObject, eventdata, handles)
% hObject    handle to batchdensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
subf = ls(foldername);

for i = 3:size(subf,1)
    ff = fullfile(foldername, subf(i,:));
    if isfolder(ff)
        densityPlot(deblank(ff))
    end
end
disp('I have completed all tasks');


% --- Executes on button press in outside.
function outside_Callback(hObject, eventdata, handles)
% hObject    handle to outside (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of outside


% --- Executes on button press in onborder.
function onborder_Callback(hObject, eventdata, handles)
% hObject    handle to onborder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of onborder



function x1_Callback(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1 as text
%        str2double(get(hObject,'String')) returns contents of x1 as a double


% --- Executes during object creation, after setting all properties.
function x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function y1_Callback(hObject, eventdata, handles)
% hObject    handle to y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y1 as text
%        str2double(get(hObject,'String')) returns contents of y1 as a double


% --- Executes during object creation, after setting all properties.
function y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2_Callback(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x2 as text
%        str2double(get(hObject,'String')) returns contents of x2 as a double


% --- Executes during object creation, after setting all properties.
function x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y2_Callback(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y2 as text
%        str2double(get(hObject,'String')) returns contents of y2 as a double


% --- Executes during object creation, after setting all properties.
function y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function r1_Callback(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r1 as text
%        str2double(get(hObject,'String')) returns contents of r1 as a double


% --- Executes during object creation, after setting all properties.
function r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r2_Callback(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r2 as text
%        str2double(get(hObject,'String')) returns contents of r2 as a double


% --- Executes during object creation, after setting all properties.
function r2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SetROIs.
function SetROIs_Callback(hObject, eventdata, handles)
% hObject    handle to SetROIs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

d = dir([handles.SelectData.UserData '\*.png']);

if isempty(d)
    disp("Weird, can't find image files in folder, going in one folder level");
    d = dir([handles.SelectData.UserData '\**\*.png']);
end


img = imread(fullfile(d(1).folder, d(1).name));
figure()
img = imrotate(img, -90);
imshow(fliplr(img))

title(gca,'draw outer circle and press any key');
roi1 = drawcircle('Color', 'b');
pause();
center1 = roi1.Center;
radius1 = roi1.Radius;


handles.x1.String = num2str(center1(1));
handles.y1.String = num2str(center1(2));
handles.r1.String = num2str(radius1);


title(gca,'draw inner circle and press any key');
roi2 = drawcircle('Color', 'r');
pause();
center2 = roi2.Center;
radius2 = roi2.Radius;

handles.x2.String = num2str(center2(1));
handles.y2.String = num2str(center2(2));
handles.r2.String = num2str(radius2);


saveas(gcf, fullfile(d(1).folder, 'ROIs.jpg'))
close(gcf)




% --- Executes on button press in runregion.
function runregion_Callback(hObject, eventdata, handles)
% hObject    handle to runregion (see GCBO)
% eventdata  reserved - to be defin ed in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
circstr = '';
h = handles;
codeout = getCodeout(h);
inout = handles.inoutgroup.SelectedObject.String

x1 = handles.x1.String;
y1 = handles.y1.String;
r1 = handles.r1.String;
x2 = handles.x2.String;
y2 = handles.y2.String;
r2 = handles.r2.String;

switch inout
    case 'Off Food'
        circstr = [' --out ' x1 ',' y1 ',' r1 ' '];

    case 'On Food'
        circstr = [' --in ' x1 ',' y1 ',' r1 ' '];

    case 'On Border'
        circstr1 = [' --in ' x1 ',' y1 ',' r1 ' '];
        circstr2 = [' --out ' x2 ',' y2 ',' r2 ' '];
        circstr = [circstr1 circstr2];

    case 'Lawn Interior'
        circstr = [' --in ' x2 ',' y2 ',' r2 ' '];

end

dos([codeout circstr]);






% --- Executes on button press in batchregion.
function batchregion_Callback(hObject, eventdata, handles)
% hObject    handle to batchregion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

circstr = '';
h = handles;
codeout = getCodeout(h);

region = handles.inoutgroup.SelectedObject.String

x1 = handles.x1.String;
y1 = handles.y1.String;
r1 = handles.r1.String;
x2 = handles.x2.String;
y2 = handles.y2.String;
r2 = handles.r2.String;

switch region
    case 'Off Food'
        circstr = [' --out ' x1 ',' y1 ',' r1 ' '];

    case 'On Food'
        circstr = [' --in ' x1 ',' y1 ',' r1 ' '];

    case 'On Border'
        circstr1 = [' --in ' x1 ',' y1 ',' r1 ' '];
        circstr2 = [' --out ' x2 ',' y2 ',' r2 ' '];
        circstr = [circstr1 circstr2];

    case 'Lawn Interior'
        circstr = [' --in ' x2 ',' y2 ',' r2 ' '];

end


c = regexp(codeout, 'Choreography', 'split');
code1 = [c{1} 'Choreography '];

c = regexp(c{2}, '-p 0.0', 'split');
parentfolder = deblank(c{1});
prescale = AutoScale(parentfolder);
rescale = num2str(1/str2double(prescale));
fixscale = regexp(c{2}, ' ', 'split');

fx = strrep(c{2}, fixscale{1}, rescale);



code2 = [' -p ' fx];
code2 = strrep(code2, ' -I', '');
code2 = strrep(code2, ' --map', '');

d = dir(parentfolder);
dirflags = [d.isdir];
d = d(dirflags);
d = d(3:end);


oH = regexp(code2, ' ', 'split');
oH = regexp(oH{17}, ',', 'split');
outputheaders = horzcat({'Time'}, oH);
outputtypes = {};

for i = 1:length(outputheaders)
    outputtypes = horzcat(outputtypes, {'double'});
end

sz1 = [length(d), 9];
sz2 = [length(d), length(outputheaders)];
varnames = {'Time', 'Window', 'Mean N', 'Action', '# Events', ...
    'Mean Duration', 'Stdev Duration', 'Mean Distance', 'Stdev Distance'};
vartypes = {'double', 'double', 'double', 'string', 'double', ...
    'double', 'double', 'double', 'double'};


fwdtbl = table('Size',sz1,'VariableTypes', vartypes,'VariableNames', varnames);
stptbl = table('Size',sz1,'VariableTypes', vartypes,'VariableNames', varnames);
revtbl = table('Size',sz1,'VariableTypes', vartypes,'VariableNames', varnames);
omgtbl = table('Size',sz1,'VariableTypes', vartypes,'VariableNames', varnames);
trigtbl = table('Size', sz2, 'VariableTypes', outputtypes, 'VariableNames', outputheaders);
idx = 1;

for i = 1:length(d)
    tempfolder  = fullfile(d(i).folder, d(i).name);

    sumchk = dir([tempfolder '\*.summary']);

    if ~isempty(sumchk)

        tempcode = [code1 tempfolder code2 circstr];
        dos(tempcode)

        tmptrig = ls([tempfolder '\*.trig']);
        if length(tmptrig) >1
            tmptrig = tmptrig(end,:);
        end

        trigname = fullfile(tempfolder, deblank(tmptrig));
        trpname = strrep(trigname, '.trig', '.trp.ms');


        trigdata = readtable(trigname,'FileType', 'text','Delimiter', ' ');

        trpopts = detectImportOptions(trpname, 'FileType', 'text');
        trpdata = readtable(trpname,trpopts);


        revtbl(idx, :) = trpdata(1,:);
        fwdtbl(idx, :) = trpdata(2,:);
        omgtbl(idx, :) = trpdata(3,:);
        stptbl(idx, :) = trpdata(4,:);
        trigtbl(idx,:) = trigdata;

        idx = idx+1;



    end



end

revtbl= revtbl(1:idx-1,:);
fwdtbl= fwdtbl(1:idx-1,:);
omgtbl= omgtbl(1:idx-1,:);
stptbl= stptbl(1:idx-1,:);
trigtbl = trigtbl(1:idx-1,:);


outtrig = [parentfolder '\trig_data ' region '.xlsx'];
outtrp = [parentfolder '\trp_data ' region '.xlsx'];
try
    writetable(trigtbl, outtrig,'WriteVariableNames', true);
    writetable(revtbl, outtrp, 'Sheet', 'Reversals', 'WriteVariableNames', true)
    writetable(fwdtbl, outtrp, 'Sheet', 'Forward', 'WriteVariableNames', true)
    writetable(omgtbl, outtrp, 'Sheet', 'Omega', 'WriteVariableNames', true)
    writetable(stptbl, outtrp, 'Sheet', 'Stop', 'WriteVariableNames', true)
catch
    warning('Cant write to file, try closing files then press any key')
    pause()
    writetable(trigtbl, outtrig,'WriteVariableNames', true);
    writetable(revtbl, outtrp, 'Sheet', 'Reversals', 'WriteVariableNames', true)
    writetable(fwdtbl, outtrp, 'Sheet', 'Forward', 'WriteVariableNames', true)
    writetable(omgtbl, outtrp, 'Sheet', 'Omega', 'WriteVariableNames', true)
    writetable(stptbl, outtrp, 'Sheet', 'Stop', 'WriteVariableNames', true)
end
disp('I am pleased to announce the successful conclusion of this program, Have a Nice Day');


% --- Executes on button press in align2intersect.
function align2intersect_Callback(hObject, eventdata, handles)
% hObject    handle to align2intersect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = get(handles.SelectData, 'UserData');
pf = regexp(foldername, '\', 'split');
parentfolder = strrep(foldername, pf{end}, '');
scale = str2double(AutoScale(parentfolder));


speedidx = 3;        % which column in dat has "speed".
framesprior = 750;   % how many frames before food contact to record.
crop_percent =0.1;  % how far to crop image in percent.
minarea = 50000;    % minimum area of ROI in pixels.

sf = dir([foldername '\*.spine']);
if isempty(sf)
    warning('Hey you! No spine files found! Check "Use Extract" with Spine selected')
end

iname = regexp(sf(1).name, '\.','split');


%% read image file and filter
img = dir([foldername '\' iname{1} '.png']);
I = imread(fullfile(img(1).folder,img(1).name));

% I = medfilt2(I,[100 100]);    % denoise with median filter
BW1 = edge(I,'canny');      % detect edges with Canny filter
CC1 = bwconncomp(BW1,8);
stats1 = regionprops(CC1,'area');
idx = find([stats1.Area] > 1000);
BW1 = ismember(labelmatrix(CC1),idx);


BW2 = bwmorph(bwmorph(BW1,'dilate',2),'erode',2);


figure()
imshow(BW2)

%% Crop image to simplify identification of central ROI

indent = floor(size(I,1)*crop_percent); 

BW2(1:indent,:) = 0;           % set edges to 0 in cropped area
BW2(:,1:indent) = 0;
BW2(end-indent:end,:)=0;
BW2(:,end-indent:end) = 0;

%% identify connected components
CC = bwconncomp(BW2,8);
L = labelmatrix(CC);
stats = regionprops(CC,"Eccentricity","Area","ConvexArea");

% 
% figure()
% imshowpair(I,label2rgb(L,'jet','k','shuffle'),'montage');

% identify circle based on area and eccentricity
idx = find([stats.ConvexArea]>minarea);


  
if ~isempty(idx)
    sz = size(I);
    ind = CC.PixelIdxList{1,idx(1)};
    [ROI_y, ROI_x] = ind2sub(sz,ind); % ROI coordinates

end
%  
% figure()
%  imshowpair(I,label2rgb(L,'jet','k','shuffle'),'montage');
%   imshowpair(I,BW1,'montage');
figure()
imshow(label2rgb(L,'jet','k','shuffle'))
fig = gcf;
exportgraphics(fig,[foldername '\' iname{1} '_ROI_Labels.png'],"Resolution",300)

%% convert roi coordinates from pixels to mm units
ROI_x = ROI_x/scale;
ROI_y = ROI_y/scale;
figure()
scatter(ROI_x,ROI_y)





roi_coords = round([ROI_x ROI_y],1);



count = 1;
speed = nan(8000,length(sf)); % generate a matrix to hold aligned velocity traces.

for i = 1:length(sf)
    spinepath = fullfile(sf(i).folder,sf(i).name);
    datpath = strrep(spinepath,'.spine','.dat');
    tempdat = readmatrix(datpath);
    tempspine = readmatrix(spinepath, 'FileType', 'text');

    if length(tempdat) ~= length(tempspine)
        warning('Hey you! Data resolution mismatch! Re-analyze folder using 0.01 for "speed averaging windows" and "time between data points"')
    end

    xloc = tempspine(:,2);
    yloc = tempspine(:,3);

    hold on
    scatter(xloc,yloc,2,'k','.')

    track_coords = round([xloc yloc],1);

    [~, ~, ib] = intersect(roi_coords,track_coords, 'rows');
    ib = min(ib);

    if ~isempty(ib)
        scatter(xloc(ib(1)),yloc(ib(1)),20,'r','+')
        text(xloc(ib(1)),yloc(ib(1)), num2str(count), "FontSize",12)

            if ib-framesprior <1
                gap = abs(ib-framesprior);
                tempspeed(1:gap,1) = nan;
                tempspeed(gap+1:gap+length(tempdat),1) = tempdat(:,speedidx);
            elseif ib-framesprior>1
            tempspeed = tempdat(ib-framesprior:length(tempdat),speedidx);
            end

            speed(1:length(tempspeed),count) = tempspeed;
            count = count+1;

        
    end


    if mean(speed,"all",'omitnan')>0.5
        warning(['Speed values are outside of expected range, check to make sure ' ...
            'spdidx points to the correct column in the dat file!'])
    end


end
speed = speed(1:framesprior*2,:);
time = linspace(-framesprior/15,framesprior/15, length(speed));



outname = [foldername '\' iname{1} '_Aligned_Velocity.xlsx'];
delete(outname);
writematrix(horzcat(time',speed),outname)

fig = gcf;
exportgraphics(fig,[foldername '\' iname{1} '_Tracks.png'],"Resolution",300)

hold off
figure()
plot(time,mean(speed,2,'omitnan'));
ax1 = gca;
line([0 0], ax1.YLim)
fig = gcf;
exportgraphics(fig,[foldername '\' iname{1} '_mean_Velocity.png'],"Resolution",300)

