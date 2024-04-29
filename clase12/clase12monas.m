close all
clear
clc

% cargar imagen y descomponer en componentes de canales de color

rgb = imread('monas.jpg');
      figure,imshow(rgb);

izq = rgb(:,1:300,:);
      figure,imshow(izq);

R = izq(:,:,1);
G = izq(:,:,2);
B = izq(:,:,3);

% Ecualizar los histogramas de las componentes de color para aumentar
% contraste.
r_eq = histeq(R);
g_eq = histeq(G);
b_eq = histeq(B);

% % Evaluar si el aumento del contraste si está funcionando.
%     figure,subplot(1,2,1),imshow(R);
%            subplot(1,2,2),imshow(r_eq);
% 
%     figure,subplot(1,2,1),imshow(G);
%            subplot(1,2,2),imshow(g_eq);
% 
%     figure,subplot(1,2,1),imshow(B);
%            subplot(1,2,2),imshow(b_eq);

% Reconstrucción de la imagen RGB, esta vez con la parte izquierda
% modificada.

rgb(:,1:300,1) = r_eq;
rgb(:,1:300,2) = g_eq;
rgb(:,1:300,3) = b_eq;
    figure,imshow(rgb);