close all
clear
clc

% cargar imagen y descomponer en componentes de canales de color

% rgb = imread('hojaQuemada.jpg');
%       figure,imshow(rgb);
% 
% R = rgb(:,:,1);
% G = rgb(:,:,2);
% B = rgb(:,:,3);
% 
%     figure,subplot(1,3,1),imshow(R);
%            subplot(1,3,2),imshow(G);
%            subplot(1,3,3),imshow(B);

rgb = imread('hojaQuemada.jpg');
      figure,imshow(rgb);

hsv = rgb2hsv(rgb);

H = hsv(:,:,1);
S = hsv(:,:,2);
V = hsv(:,:,3);

    figure,subplot(1,3,1),colormap('jet'),imagesc(H); axis image;
           subplot(1,3,2),colormap('jet'),imagesc(S); axis image;
           subplot(1,3,3),colormap('jet'),imagesc(V); axis image;

hMod = 0*H;          % visualmente, se halla que la componente H permite
                     % detectar las regiones "quemada" y no quemada de la hoja
hMod(H <= 0.08) = 1; % para detectar la region "quemada" de la hoja.
hMod(H > 0.5) = 2;  % para detectar el fondo de la imagen.
        figure,imagesc(hMod); axis image;


%ubralizar componente donde se ve más fácil separar la reguión "quemada" de
%la hoja

% bw_r = imbinarize(R);
%     figure,imshow(bw_r);