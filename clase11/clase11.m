close all
clear
clc

%% problema de calcular el histograma de la ROI que contiene el ojo en una imagen RGB

% imagen = imread('2.jpg');
% figure,imshow(imagen);title('Original');


% imagenGray = rgb2gray(imagen);
% hist_eg = fnHistograma(imagenGray);
% hist_eg(1,2) = 0; % fácil, no recomendada.
% figure,bar(hist_eg);grid on;

% posible solución: los píxeles fuera de la ROI que encierra el ojo,
% asignarles un valor por fuera del intervalo 0:255.

% imagen_bw = imbinarize(imagenGray); % Función que convierte la imagen en vinario
% imagen_bw = bwareaopen(imagen_bw, 5000);
% figure,imshow(imagen_bw);title('Imagen Binaria');
% 
% imagenGray = double(imagenGray);
% imagenGray(imagen_bw == 0) = -1;
% hist_eg2 = fnHistograma(imagenGray);
% figure,bar(hist_eg2);grid on


% obtener histogramas en la ROI que encierra el ojo, pero esta vez por cada
% canal de color de la imagen RGB original. Mostrar los histogramas de los
% canales de color en subplot

imagen = imread('2.jpg');
R = double(imagen(:,:,1));
G = double(imagen(:,:,2));
B = double(imagen(:,:,3));

% imagen_eg = rgb2gray(imagen);
% mascara = imbinarize(imagen_eg);
% mascara = bwareaopen(mascara, 5000);
% 
% R(mascara == 0) = -1;
% G(mascara == 0) = -1;
% B(mascara == 0) = -1;
% 
% hist_R = fnHistograma(R);
% hist_G = fnHistograma(G);
% hist_B = fnHistograma(B);
% 
% figure,subplot(1,3,1),bar(hist_R);grid on;title('Histograma - canal R');
%        subplot(1,3,2),bar(hist_G);grid on;title('Histograma - canal G');
%        subplot(1,3,3),bar(hist_B);grid on;title('Histograma - canal B');


% (3. ) En la imagen metastasis.jpg dejar sin cambios los píxeles que
% comprenden la ROI del virus. El resto de la imagen  debe quedar borrosa.
% todo el trabajo debe hacerse pra la imagen a color.

imagen = imread('metastasis.jpg');
figure,imshow(imagen);title('Original');
R = double(imagen(:,:,1));
G = double(imagen(:,:,2));
B = double(imagen(:,:,3));

n = 21;
filtro_PB = (1/(n^2))*ones(n);
R = conv2(R,filtro_PB,'same');
G = conv2(G,filtro_PB,'same');
B = conv2(B,filtro_PB,'same');

imagen_PB = cat(3,R,G,B);
figure,imshow(uint8(imagen_PB));title('Original');

% Deteccióon de la ROI: la región que encierra la célula/virus.
hsv = rgb2lab(imagen);
a = hsv(:,:,2);
mascara = imbinarize(a);
figure,colormap('gray'),imagesc(mascara);axis image;


