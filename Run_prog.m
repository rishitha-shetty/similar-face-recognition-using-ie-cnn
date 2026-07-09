function varargout = Run_prog(varargin)
% RUN_PROG MATLAB code for Run_prog.fig
%      RUN_PROG, by itself, creates a new RUN_PROG or raises the existing
%      singleton*.
%
%      H = RUN_PROG returns the handle to a new RUN_PROG or the handle to
%      the existing singleton*.
%
%      RUN_PROG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUN_PROG.M with the given input arguments.
%
%      RUN_PROG('Property','Value',...) creates a new RUN_PROG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Run_prog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Run_prog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Run_prog

% Last Modified by GUIDE v2.5 11-Jun-2020 17:36:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Run_prog_OpeningFcn, ...
                   'gui_OutputFcn',  @Run_prog_OutputFcn, ...
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


% --- Executes just before Run_prog is made visible.
function Run_prog_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Run_prog (see VARARGIN)

% Choose default command line output for Run_prog
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Run_prog wait for user response (see UIRESUME)
% uiwait(handles.figure1);

I = imread('fg.jpg');

axes(handles.axes1);
imshow(I);

% --- Outputs from this function are returned to the command line.
function varargout = Run_prog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Main_GUI
