close all;
clear;
clc
imagen = imread('gray.jpeg');
%imagen = double(imagen);
figure, imshow(imagen);title('imagen original');
%%filtrado pasa-bajos para reducir ruido.
imagenRuido = imnoise(imagen,'salt & pepper');
figure, imshow(imagenRuido);title('imagen con ruido');
kernelPB = (1/9)*ones(7); %filtro promedio (estaba en 3 el ones)
imagenfiltrada = conv2(imagenRuido,kernelPB,'same');
figure, imshow(uint8(imagenfiltrada));title('imagen filtrada');
%%calculo de magnitud del gradiente; filtrado pasa-altos
% operadores/filtros/kernels para hacer filtrado pasa-altos
%concretamente, operadores de sobel
%Hx = [-1 0 1;-2 0 2;-1 0 1];
%Hy = [-1 -2 -1;0 0 0;1 2 1];
%calculo de componentes del gradiente. se hace via convolucion.
%Gx = conv2(imagen,Hx, 'same');
%Gy = conv2(imagen,Hy, 'same');
%calculo de la magnitud del gradiente
%Mg = sqrt((Gx.^2) + (Gy.^2));
%
% figure,imshow(uint8(imagen));
% figure,colormap('gray'),imagesc(Mg);axis image;