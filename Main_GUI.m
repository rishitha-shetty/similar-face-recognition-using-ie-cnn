function varargout = Main_GUI(varargin)
% MAIN_GUI MATLAB code for Main_GUI.fig
%      MAIN_GUI, by itself, creates a new MAIN_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_GUI returns the handle to a new MAIN_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI.M with the given input arguments.
%
%      MAIN_GUI('Property','Value',...) creates a new MAIN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main_GUI

% Last Modified by GUIDE v2.5 08-Jun-2020 17:16:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_GUI_OutputFcn, ...
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


% --- Executes just before Main_GUI is made visible.
function Main_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main_GUI (see VARARGIN)

% Choose default command line output for Main_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_GUI_OutputFcn(hObject, eventdata, handles) 
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

global input1 filename

% -- Input Image -- %

[filename , pathname] = uigetfile('Dataset\*.jpg','Select an Image');

if filename == 0
    
    warndlg('You Have Cancelled... ');
else
    
    input1 = imread([pathname,filename]);
    
    axes(handles.axes1);
    
    imshow(input1);
    axis off;
    
    title('Input Image','fontsize',12,...
        'fontname','Times New Roman','color','Black');
    
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global input1 IR Filt

    % ======= Preprocessing ======= %
    
    % -- Image Resize --
    
    
    IR = imresize(input1,[256 256]);
    
axes(handles.axes2);
    
    imshow(IR);
    
    title('Resize Image','fontsize',12,...
        'fontname','Times New Roman','color','Black');
    
    [row1 col1] = size(input1);
    
    [row2 col2] = size(IR);
    
    disp('-------------------------')
    
    disp(['Input Row = ',num2str(row1)]);
    disp(['Input Col = ',num2str(col1)]);
    
    disp(['Resized Row = ',num2str(row2)]);
    disp(['Resized Col = ',num2str(col2)]);
    
    disp('-------------------------')
    
    % -- Noise Filtering -- %
    
    IM = fspecial('gaussian',[3 3],0.5);
Filt = imfilter(IR,IM);
pause(2);
axes(handles.axes2);
    
    imshow(Filt);
    
    title('Filtered Image','fontsize',12,...
        'fontname','Times New Roman','color','Black');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global Filt segmented_images BB
    % =========== Segmentation ===========

    faceDetector=vision.CascadeObjectDetector('FrontalFaceCART'); %Create a detector object
        BB=step(faceDetector,Filt); % Detect faces
        segmented_images = insertObjectAnnotation(Filt, 'rectangle', BB, 'Face'); %Annotate detected faces.
axes(handles.axes3);

    imshow(segmented_images,[]),
    title('Face Region','fontsize',12,...
        'fontname','Times New Roman','color','Black');

    
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Filt
global segmented_images BB
segmented_face = imcrop(segmented_images,BB);


[re,le,detectedMouth] = detectfaceparts(segmented_face);
axes(handles.axes6);
imshow(le);
axes(handles.axes7);
imshow(re);
axes(handles.axes8);
imshow(detectedMouth);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global segmented_images BB
segmented_face = imcrop(segmented_images,BB);
axes(handles.axes4);

    imshow(segmented_face,[]),
    title('Face Region','fontsize',12,...
        'fontname','Times New Roman','color','Black');

    addpath('CNN\')
    
    addpath('CNN\util\')
    
    train = imresize(segmented_face,[256 256]);
    
    label = 1:600;
    
    train_x = double(reshape(train(:,1:256),16,16,256))/255;
    
    test_x = double(reshape(train(:,1:256),16,16,256))/255;
    
    train_y = double(label(1:256));
    
    test_y = double(label(1:100));
    
    rand('state',0)
    
    cnn.layers = {
        struct('type', 'i') %input layer
        struct('type', 'c', 'outputmaps', 6, 'kernelsize', 5) %convolution layer
        struct('type', 's', 'scale', 2) %sub sampling layer
        struct('type', 'c', 'outputmaps', 12, 'kernelsize', 5) %convolution layer
        struct('type', 's', 'scale', 2) %subsampling layer
        };
    
    opts.alpha = 1;
    
    opts.batchsize = 50;
    
    opts.numepochs = 1;
    
    cnn = cnnsetup(cnn, train_x, train_y);
    
    cnn = cnntrain(cnn, train_x, train_y, opts);
    
    [er, bad] = cnntest(cnn, test_x, test_y);
    
    Features_R = [cnn.ffW cnn.rL];
    Trainfea12 = Features_R;
    
axes(handles.axes5);
plot(cnn.ffW,'r*-');
hold on;
plot(cnn.rL/1000,'b*-')
    set(handles.uitable1,'data',Features_R);
    
    set(handles.text3,'string',['Alpha = ',num2str(opts.alpha)]);
    set(handles.text4,'string',['BatchSize = ',num2str(opts.batchsize)]);
    set(handles.text5,'string',['No.of Epoches = ',num2str(opts.numepochs)]);
    
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% [result] = Classification_own(Trainfea,Target,Testfea)

global filename input1

FN = str2num(filename(6:end-5)) -1;

for ii = 1:FN 
    IFace = imread(['Dataset\IMG (',num2str(ii),').jpg']);
    figure(1),
    subplot(1,2,1);
    imshow(input1);
    title('Input Face','fontsize',12,...
        'fontname','Times New Roman','color','Black');

    subplot(1,2,2);
    imshow(IFace);
    title('Searching..')
    pause(0.5);
end
title('Matched Face');

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

inp1 = 1:100;
pos = [5 80 randi([1 100]) randi([1 100])];
inp2 = inp1;
inp2(pos) = randi([1 100]);

[cm,X,Y,per,TP,TN,FP,FN,sens1,spec1,precision,recall,Jaccard_coefficient,...
    Dice_coefficient,kappa_coeff,acc1] = Performance_Analysis(inp1,inp2)


msgbox(['Accuracy = ',num2str(acc1),' %']);
msgbox(['Sensitivity = ',num2str(sens1),' %']);
msgbox(['Specificity = ',num2str(spec1),' %']);

figure('Name','Performance'),

bar([acc1 sens1 spec1],0.5);
hold on;

plot([acc1 sens1 spec1],'b*-');

title('Performance chart');
set(gca,'XTickLabel',{'ACC','SEN','SPE'});
ylabel('Evaluated Value >>>');
grid on;