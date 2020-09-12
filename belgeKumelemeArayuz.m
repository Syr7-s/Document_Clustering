function varargout = belgeKumelemeArayuz(varargin)
% BELGEKUMELEMEARAYUZ MATLAB code for belgeKumelemeArayuz.fig
%      BELGEKUMELEMEARAYUZ, by itself, creates a new BELGEKUMELEMEARAYUZ or raises the existing
%      singleton*.
%
%      H = BELGEKUMELEMEARAYUZ returns the handle to a new BELGEKUMELEMEARAYUZ or the handle to
%      the existing singleton*.
%
%      BELGEKUMELEMEARAYUZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BELGEKUMELEMEARAYUZ.M with the given input arguments.
%
%      BELGEKUMELEMEARAYUZ('Property','Value',...) creates a new BELGEKUMELEMEARAYUZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before belgeKumelemeArayuz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to belgeKumelemeArayuz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help belgeKumelemeArayuz

% Last Modified by GUIDE v2.5 02-Aug-2020 12:47:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @belgeKumelemeArayuz_OpeningFcn, ...
                   'gui_OutputFcn',  @belgeKumelemeArayuz_OutputFcn, ...
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


% --- Executes just before belgeKumelemeArayuz is made visible.
function belgeKumelemeArayuz_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to belgeKumelemeArayuz (see VARARGIN)

% Choose default command line output for belgeKumelemeArayuz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global sayac;
sayac=0;

   iconum1 = imread ( 'hosgeldiniz.png' );
   iconum = imresize (iconum1,[64,64]);
   uiwait(msgbox("Belge Kumeleme (Document Clustering) uygulamas�na Ho�geldiniz...","Welcome Document Clustering","custom",iconum));
  
   %set(gcf, 'units','normalized','innerposition',[0 0 1 1]);
% UIWAIT makes belgeKumelemeArayuz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = belgeKumelemeArayuz_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cikisBtn.
function cikisBtn_Callback(~, ~, ~)
% hObject    handle to cikisBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

closereq();

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(~, eventdata, ~)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in wordCloudBtn.
function wordCloudBtn_Callback(~, eventdata, handles)
% hObject    handle to wordCloudBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit2,'String','Word Cloud (Kelime Bulutu) Olu�turuluyor...');
global newBag;
global wordDeger;
global countDeger;
global wordDegerTbl2;
global countDegerTbl2;
global oldBag;
axes(handles.axes1);
subplot(1,2,1)
wordcloud(oldBag);
title("Belge'nin Ilk Hali");
subplot(1,2,2)
wordcloud(newBag);
title("Belge'nin Son Hali");
set(handles.edit2,'String','Word Cloud (Kelime Bulutu) Olu�turuluyor...');
set(handles.edit3,'String',wordDeger);
set(handles.edit4,'String',countDeger);
set(handles.edit5,'String',wordDegerTbl2);
set(handles.edit6,'String',countDegerTbl2);

% --- Executes on button press in KMeansBtn.
function KMeansBtn_Callback(hObject, eventdata, handles)
% hObject    handle to KMeansBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit2,'String','K-Means K�meleme Yap�l�yor...');
global M;
axes(handles.axes2)
plot(M(:,10),M(:,10),'k*','color','blue',...
   'LineWidth' , 2, ... 
   'MarkerSize' , 10, ... 
   'MarkerEdgeColor' , 'b' , ... 
   'MarkerFaceColor' , [0.5 , 0.5,0.5]);
    title 'K-Means Belge K�meleme';
    xlabel 'Uzunluk (cm)'; 
    ylabel 'Geni�lik (cm)';

% --- Executes on button press in HiyerarsikBtn.
function HiyerarsikBtn_Callback(~, ~, handles)
% hObject    handle to HiyerarsikBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit2,'String','Hiyerar�ik K�meleme Yap�l�yor...');
global idx;
axes(handles.axes3);
% Z=linkage(idx);
% firstfive=Z(1:5,:)
% dendrogram(Z);
    eucD = pdist(idx,'euclidean');
    clustTreeEuc = linkage(eucD,'average');
    cophenet(clustTreeEuc,eucD)
    [h,nodes] = dendrogram(clustTreeEuc,0);
    h_gca = gca;
    h_gca.TickDir = 'out';
    h_gca.TickLength = [.002 0];
    h_gca.XTickLabel = [];
set(handles.edit2,'String' ,'K�meleme Bitti.....') ;   





% --- Executes on button press in belgeSecBtn.
function belgeSecBtn_Callback(~, ~, handles)
% hObject    handle to belgeSecBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global sayac;
global belgeSec;
if sayac==0
    belgeSec=uigetfile('*','.pdf,.docx,.txt','L�tfen belge se�iniz.');
    if contains(belgeSec,".pdf")
         set(handles.text2,'String',belgeSec);
         sayac=sayac+1;
         iconum1 = imread ( 'pdftrial.png' );
         iconum = imresize (iconum1, [32 , 32]);
         msgbox ("Se�ilen belge bir PDF belgesidir","Pdf belge",'custom', iconum); % Not: �zel �imdi arg 3!
    elseif contains(belgeSec,".docx")
         set(handles.text2,'String',belgeSec);
         sayac=sayac+1;
         iconum1 = imread ( 'docx.png' );
         iconum = imresize (iconum1, [32 , 32]);
         msgbox ("Se�ilen belge bir DOCX belgesidir.","DOCX belge",'custom', iconum); % Not: �zel �imdi arg 3!
    elseif contains(belgeSec,".txt")
         set(handles.text2,'String',belgeSec);
         sayac=sayac+1;
         iconum1 = imread ( 'txt.png' );
         iconum = imresize (iconum1, [32 , 32]);
         msgbox ("Se�ilen belge bir TXT belgesidir.","TXT belge",'custom', iconum); % Not: �zel �imdi arg 3!
    else
      f=msgbox("Se�ilen Belge .pdf .docx ya da .txt uzant�l� bir belge de�il.....",'Yanl�� Belge Se�imi','warn');
  
    end 
else   
    f1=msgbox("Sadece bir kez belge se�ilebilir ve k�meleme yap�labilir. Farkl� bir belge i�in uygulamadan ��k�� yap�p, uygulamay� tekrar �al��t�r�n�z...","Belge Se�imi","warn");
end

% --- Executes on button press in belgeOnIslemeBtn.
function belgeOnIslemeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to belgeOnIslemeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global belgeSec;
 global idx;
 global M;
 global newBag;
 global wordDeger;
 global countDeger;
 global oldDocument;
 global oldBag;
 global wordDegerTbl2;
 global countDegerTbl2;
   try
    belge=extractFileText(belgeSec);
    oldDocument=belge;
    oldBag=tokenizedDocument(oldDocument);
    disp('Tum Metin');
    disp('*************************');
    disp(belge);
    disp('*************************');
    dil=corpusLanguage(belge);
    belge=lower(belge);   
    belge=erasePunctuation(belge); 
    belge=splitSentences(belge);
    belge=normalizeWords(belge,'Style','lemma');
    belge=tokenizedDocument(belge);
    disp('TokenizedDocument');
    disp(belge);
    writeTextDocument(belge,'T�mMetin.txt');
    belge=addLanguageDetails(belge); 
    belge=addPartOfSpeechDetails(belge);
    belge=removeShortWords(belge,2);%2 den daha az olan kelimeleri silmek icin
    belge=removeLongWords(belge,15);%15 harfden uzun kelimeleri silmek i�in kullan�l�r.
    words = ["hi�bir" "veya" "the" "�ok" "m��teri" "test" "komutu" "girdi" "de�erleri" "geri" "g�venli�i" "introduction" "2nd" "yes" "no" "g�venlik" "eri�im" "?" "sans�rleme" "in" "on" "but" "for" "�ekil" "�ekilde" "sonra" "because" "and" "to" "is" "are" "they" "I" "fazla" "farkl�" "ise" "ya" "da"  "sadece" "olarak" "olan" "ihtiyac" "ancak" "daha" "yeni" "of" "belli" "kom�u" "biri" "ile" "�zellikle" "kullan�lan" "olarak" "i�in" "gibi" "itibaren" "en" "de" "ki" "Prof" "Dr" "Resul" "KARA" "prof" "dr" "resul" "kara" "her" "2001db82aafffe289c5a" "?" "1990l�" "tek" "ayn�" "temel" "ba�l�k" "icin" "bir" "ve" "bilgi" "ama" "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "fakat" "ve" "bu"  ];
    belge=removeWords(belge,words);
    belge=addLemmaDetails(belge);
    tokenD=tokenDetails(belge);
    head(tokenD);
    disp("**********************************");
    disp("TokenD");
    disp(tokenD);
    disp("**********************************");
    oldBag=bagOfWords(oldBag);
    tbl2=topkwords(oldBag,20);
    head(tbl2)
    hesaplama=tbl2;
    maksimumDegerTbl2=max(hesaplama.Count);
    disp("MaksimumDeger Table 2: "+maksimumDegerTbl2);
    tabloHucresitbl2=table2cell(tbl2);
    maksimumDegerlerSonucuTbl2=tabloHucresitbl2(1,:);
    degerSonucTbl2=cell2table(maksimumDegerlerSonucuTbl2);
    wordDegerTbl2=degerSonucTbl2.maksimumDegerlerSonucuTbl21;
    countDegerTbl2=degerSonucTbl2.maksimumDegerlerSonucuTbl22;
    disp("�n i�leme yap�lmam�� wordDeger: "+wordDegerTbl2+" �n i�leme yap�lmam�� CountDeger: "+countDegerTbl2);
    bag=bagOfWords(belge);
    tbl1=topkwords(bag,20);
    head(tbl1)
    hesaplama=tbl1;
    maksimumDeger=max(hesaplama.Count);
    disp("MaksimumDeger: "+maksimumDeger);
    tabloHucresi=table2cell(tbl1);
    maksimumDegerlerSonucu=tabloHucresi(1,:);
    degerSonuc=cell2table(maksimumDegerlerSonucu);
    wordDeger=degerSonuc.maksimumDegerlerSonucu1;
    countDeger=degerSonuc.maksimumDegerlerSonucu2;
    disp("wordDeger: "+wordDeger+" CountDeger: "+countDeger); 
    count=10;
    newBag=removeInfrequentWords(bag,count);
    M=tfidf(newBag);
    full(M(1:10,1:10))
    idx=kmeans(M,5);
    catch MException
        disp(MException);
        disp(MException.message); 
        f1=msgbox(MException.message+"Uygulamay� Sonland�r"," Hata Olustu...","error");
    end
set(handles.edit2,'String','�n ��leme Yap�l�yor...');

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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bilgilendirmeBtn.
function bilgilendirmeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to bilgilendirmeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)global 
global mesaj;
mesaj='Bu uygulamada sadece �ifresiz belgeler �zerinde metin �n i�leme ad�mlar� ad�m ad�m yap�larak belge en anla��l�r hale geldi. Bu �n i�leme ad�mlar�ndan sonra 2 ayr� k�meleme algoritmas� ile k�meleme yap�lm��t�r. LDA modeli incelenmek istenirse ilk olarak LDA model butonua t�klanmal� aksi halde di�er LDA butonlar�na t�klan�nca �al��maz.';
f=msgbox(mesaj,'Bilgilendirme','help');


% --- Executes on button press in lutfenTiklayinizBtn.
function lutfenTiklayinizBtn_Callback(hObject, eventdata, handles)
% hObject    handle to lutfenTiklayinizBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mesaj2;
mesaj2='�n i�leme Yap�lmas� ve Yap�lmamas� se�ilen belge �zerinde yap�lan metin analiz sonucunda belge de en fazla ge�en kelime ve say�s� hakk�nda bilgi verilmektedir. Bu bilgiler do�rultusunda belgenin ne oldu�u hakk�nda yorum yap�labilir.�lk kutucukdaki iki kelime ve kelime say�s� �n i�leme yap�lan belgede en fazla ge�en kelimeyi ve say�s�n� g�sterir.Eski Kelime ve Kelime Say�s� kutucu�u ise �n i�leme yap�lmam�� belgede en fazla ge�en token ve say�s�n� verir.';
f=msgbox(mesaj2,'�n ��leme Hakk�nda','help');

% --- Executes on button press in LdaModelBtn.
function LdaModelBtn_Callback(hObject, eventdata, handles)
% hObject    handle to LdaModelBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global newBag
mdl2=fitlda(newBag,4);
figure('Name','4 Basl�kl� LDA Modeli ve Bulut G�r�n�m� ','NumberTitle' , 'off');
    for topicIdx = 1:4
        subplot(2,2,topicIdx)
        wordcloud(mdl2,topicIdx);
        title("Konu: " + topicIdx)
    end

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in OnBaslikliLDABtn.
function OnBaslikliLDABtn_Callback(hObject, eventdata, handles)
% hObject    handle to OnBaslikliLDABtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global newBag;
global model;
global konuSay;
konuSay = 4;
model = fitlda(newBag,konuSay,'Verbose',0);
k = 10;
topicIdx = 1;
tbl3 = topkwords(model,k,topicIdx);
head(tbl3);
disp(tbl3);
figure('Name','10 Baslikli LDA modeli','NumberTitle' , 'off')
wordcloud(tbl3.Word,tbl3.Score);


% --- Executes on button press in LDAKonuKaristiriciBtn.
function LDAKonuKaristiriciBtn_Callback(hObject, eventdata, handles)
% hObject    handle to LDAKonuKaristiriciBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global model;
global newBag;
global konuSay;

% figure('Name','Y���lm�� �ubuk grafik, Konu ba�l�k G�rselle�tirme','NumberTitle' , 'off')
axes(handles.axes3);
konuKarisimi = transform(model,newBag.Counts(1:3,:));
barh(konuKarisimi,'stacked')
xlim([0 1])
title("Konu Kar���mlar�")
xlabel("Konu Olas�l���")
ylabel("Belge")
legend("Konu "+ string(1:konuSay),'Location','northeastoutside')
set(handles.edit2,'String','LDA konu kar��t�r�c�...');


% --- Executes on button press in LdaModelNedirBtn.
function LdaModelNedirBtn_Callback(hObject, eventdata, handles)
% hObject    handle to LdaModelNedirBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=msgbox('Latent Dirichlet Allocation (LDA), her belgenin bir konu koleksiyonu olarak kabul edildi�i ve belgedeki her kelimenin konulardan birine kar��l�k geldi�i bir topic modeling �rne�idir.Bir belge(text data) se�ildi�inde LDA belgeyi temel alarak her konu grubunu o grubu en iyi a��klayan bir dizi kelimenin oldu�u konu gruplar�na k�meler.','LDA Modeli...','help');
