function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 08-Dec-2015 01:25:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

llTypeList = {'Life', 'High Life', 'Replicator', 'Fredkin',...
	'Gnarl', 'Maze', 'Inkspot', 'Assimilation'};

set(handles.llType,'String',llTypeList);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function w1dGens_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w1dGens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function w1dRule_CreateFcn(hObject, eventdata, handles)
% hObject    handle to asd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in w1dRun.
function w1dRun_Callback(hObject, eventdata, handles)
% hObject    handle to w1dRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

w1dGens = str2double(get(handles.w1dGens, 'String'));
w1dRule = str2double(get(handles.w1dRule, 'String'));

if w1dGens < 0 || w1dRule < 0
	msgbox('Please enter positive numbers.', 'Error');
else
	wolfram(w1dGens, w1dRule);
end


% --- Executes during object creation, after setting all properties.
function brainGens_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brainGens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function brainSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brainSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in brainRun.
function brainRun_Callback(hObject, eventdata, handles)
% hObject    handle to brainRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

brainGens = str2double(get(handles.brainGens, 'String'));
brainSize = str2double(get(handles.brainSize, 'String'));

if brainGens < 0 || brainSize < 0
	msgbox('Please enter positive numbers.', 'Error');
else
	brain(brainGens, brainSize);
end


% --- Executes during object creation, after setting all properties.
function wireGens_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wireGens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function wireSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wireSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function wireGens_Callback(hObject, eventdata, handles)
% hObject    handle to wireGens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wireGens as text
%        str2double(get(hObject,'String')) returns contents of wireGens as a double



function wireSize_Callback(hObject, eventdata, handles)
% hObject    handle to wireSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wireSize as text
%        str2double(get(hObject,'String')) returns contents of wireSize as a double


% --- Executes on button press in wireRun.
function wireRun_Callback(hObject, eventdata, handles)
% hObject    handle to wireRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

wireGens = str2double(get(handles.wireGens, 'String'));
wireSize = str2double(get(handles.wireSize, 'String'));

if wireGens < 0 || wireSize < 0
	msgbox('Please enter positive numbers.', 'Error');
else
	wireworld(wireGens, wireSize);
end



function seedsGens_Callback(hObject, eventdata, handles)
% hObject    handle to seedsGens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seedsGens as text
%        str2double(get(hObject,'String')) returns contents of seedsGens as a double


% --- Executes during object creation, after setting all properties.
function seedsGens_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seedsGens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in seedsRun.
function seedsRun_Callback(hObject, eventdata, handles)
% hObject    handle to seedsRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

seedsGens = str2double(get(handles.seedsGens, 'String'));

if seedsGens < 0 
	msgbox('Please enter positive numbers.', 'Error');
else
	seeds(seedsGens);
end



function llGens_Callback(hObject, eventdata, handles)
% hObject    handle to llGens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of llGens as text
%        str2double(get(hObject,'String')) returns contents of llGens as a double


% --- Executes during object creation, after setting all properties.
function llGens_CreateFcn(hObject, eventdata, handles)
% hObject    handle to llGens (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function llSize_Callback(hObject, eventdata, handles)
% hObject    handle to llSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of llSize as text
%        str2double(get(hObject,'String')) returns contents of llSize as a double


% --- Executes during object creation, after setting all properties.
function llSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to llSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in llRun.
function llRun_Callback(hObject, eventdata, handles)
% hObject    handle to llRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

llGens = str2double(get(handles.llGens, 'String'));
llSize = str2double(get(handles.llSize, 'String'));
llUserInput = get(handles.llUserInput, 'Value');
llType = get(handles.llType, 'Value');

if llGens < 0 || llSize < 0
	msgbox('Please enter positive numbers.', 'Error');
else
	switch llType	% open file according to the index of popup menu
		case 1
			lifeFinal(llGens, llSize, llUserInput);
		case 2
			highLife(llGens, llSize, llUserInput);
		case 3
			replicator(llGens, llSize, llUserInput);
		case 4
			fredkin(llGens, llSize, llUserInput);
		case 5
			gnarl(llGens, llSize, llUserInput);
		case 6
			maze(llGens, llSize, llUserInput);
		case 7
			inkspot(llGens, llSize, llUserInput);
		case 8
			assimilation(llGens, llSize, llUserInput);
	end
end


% --- Executes on button press in llUserInput.
function llUserInput_Callback(hObject, eventdata, handles)
% hObject    handle to llUserInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of llUserInput


% --- Executes on selection change in llType.
function llType_Callback(hObject, eventdata, handles)
% hObject    handle to llType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns llType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from llType


% --- Executes during object creation, after setting all properties.
function llType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to llType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
