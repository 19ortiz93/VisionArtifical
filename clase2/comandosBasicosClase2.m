close all %Cierra ventanas previamente abiertas.
clear     %Limpiar/Borrar variables almacenadas en memoria
clc       %Limpiar el command window

%% cómo reconstruir una imagen RGB a partir de sus componentes de color

a = imread("flores.jpg");

r = a(:,:,1); %(todas las filas, todas las columnas, componente 1
g = a(:,:,2);
b = a(:,:,3);

a2 = cat(3,r,g,b);
 figure,imshow(uint8(a2));
 figure,imshow(uint8(a));

%% Ejercicio de obtener la composicion de dos imagenes.
% a = imread("flores.jpg");
% a = double(rgb2gray(a));
% 
% b = imread("niño.jpg");
% b = double(rgb2gray(b));
% %b = imresize(b,[400 600]);
% b = imresize(b,[size(a,1) size(a,2)]);
% 
% k = 0.5; %con 1 sale imagen a y con 0 sale imagen b
% c = (k*a) + (1-k)*b;
%     figure,imshow(uint8(c));

%% Ejercicio de leer y visualizar imagenes en escala de grises

% a = imread("niño.jpg"); % imread.m para leer imagenes

% u   -unsigned: la imagen no tiene píxeles con valor negativo.
% int -Integer: los píxeles de la imagen son enteros; sin punto decimal
% 8   -Profundidad de píxel: 8 bits; 0-255

% en los casos donde no es critico trabajar en color, la iagen RGB se
% convierte a su equivalente en escala de grises

%a =rgb2gray(a); %convierte la imagen a escala de grises

% figure,imshow(a); %figure abre una ventana.
%                   %e imshow "pone" la imagen en la ventana.

% comentar y descomentar: ctrl + r y ctrl + t, respectivamente

% r = a(:,:,1); %(todas las filas, todas las columnas, componente 1
% g = a(:,:,2);
% b = a(:,:,3);
% 
% figure,subplot(1,3,1),imshow(r);title('completamente roja')
%        subplot(1,3,2),imshow(g);title('completamente verde')
%        subplot(1,3,3),imshow(b);title('completamente azul')