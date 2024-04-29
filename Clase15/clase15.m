close all
clear
clc

a = imread('leon.jpg');
aGray = rgb2gray(a);

h = imhist(aGray); % Histograma de la imagen, con función de matlab.

figure,imshow(a);title('Original');
figure,imshow(aGray);title('Gris');
figure,bar(h);grid on;title('Histograma');xlabel('intensidad de píxel');
                                          ylabel('Frecuencia');

%% como el histograma de la imagen es bimodal se puede utilizar una umbralización global.

% umbralización manual: basada en la información del histograma.
imbw = 0*aGray;
umbral = 100;
imbw(aGray >= umbral) = 225;
figure,imshow(imbw);title('Umbralizada Manual');


%umbralización automatica: udando el metodo de otsu
%umbral_Otsu = graythresh(a);
%mul255 = umbral_Otsu * 255;
imbw = 0*aGray;
umbral_Otsu = uint8(255*graythresh(aGray));
imbw(aGray >= umbral_Otsu) = 225;
figure,imshow(imbw);title('Umbralizada Automatica');

% Umbralización multinivel cuando la imagen tiene histrograma multimodal
a2 = imread('puente.jpg');
a2Gray = rgb2gray(a2);

h2 = imhist(a2Gray); % Histograma de la imagen, con función de matlab.

figure,imshow(a2);title('Original');
figure,imshow(a2Gray);title('Gris');
figure,bar(h2);grid on;title('Histograma');xlabel('intensidad de píxel');
                                          ylabel('Frecuencia');

thresh = multithresh(a2Gray, 3);
quant_a = imquantize(a2Gray, thresh);
figure,colormap('jet'),imagesc(quant_a);axis image;

%% Ejemplo - segmentacion basada en bordes
a3 = imread("carretera.jpg");
a3Gray = rgb2gray(a3);
a3Imbi = imbinarize(a3Gray);
a3_Bordes = edge(a3Imbi,'Canny'); % Metodo de vcanny para segmentar los bordes de una imagen.
figure, colormap('gray'),imagesc(a3_Bordes); axis image;

%% Ejemplo - segmentacion basada en clustering.
