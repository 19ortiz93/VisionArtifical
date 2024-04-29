close all
clear
clc

numFiltro = int32(input('Ingrese un numero entero del 1 al 4: '));
img = imread('hojaQuemadaP3.jpg');

imagenResultado = aplicarFiltroLaplaciano(img, numFiltro);


figure,subplot(1,1,1),colormap('jet'),imagesc(imagenResultado); axis image;


% imagenResultado1 = aplicarFiltroLaplaciano('hojaQuemadaP3.jpg', 1);
% imagenResultado2 = aplicarFiltroLaplaciano('hojaQuemadaP3.jpg', 2);
% imagenResultado3 = aplicarFiltroLaplaciano('hojaQuemadaP3.jpg', 3);
% imagenResultado4 = aplicarFiltroLaplaciano('hojaQuemadaP3.jpg', 4);
% imshow(imagenResultado);
% figure,subplot(1,4,1),colormap('jet'),imagesc(imagenResultado1); axis image;
%        subplot(1,4,2),colormap('jet'),imagesc(imagenResultado2); axis image;
%        subplot(1,4,3),colormap('jet'),imagesc(imagenResultado3); axis image;
%        subplot(1,4,4),colormap('jet'),imagesc(imagenResultado4); axis image;