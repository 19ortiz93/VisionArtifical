close all
clear
clc
% %% Evaluación de opraciones aritméticas utilizadas en la forma 
% %% escalar-imagen e imagen-imagen
% a = imread('grayscaleImageCat.jpg');
% a = rgb2gray(a);
% k = 100; % aumenta la luminosidad
% z = -200; % reduce la iluminosidad
% b = a + k;
% c = a + z;
%     figure,subplot(1,4,1),imshow(a);title('Original');colorbar;
%            subplot(1,4,2),imshow(b);title('ModificadaAumentoLuminosidad');colorbar;
%            subplot(1,4,3),imshow(c);title('ModificadaDisminuyeLuminosidad');colorbar;
% 
% % Sumar un escalar a la imagen produce un aumento en la luminosidad
% % (de la imagen). Si el escalar es muy alto, la imagen tiende a saturarse.
% % al usar la multiplicación la imagen multiplica su brillo por el valor.
% % al dividir disminuye el brillo a gran escala.
% 
% %% Análisis de la función imagesc.m
% subplot(1,4,4),colormap('gray'),imagesc(b);title('Modificada - imagesec');colorbar;
%                                             axis('image');
% 
% %% Funciones para calcular dimensiones de fila columna, y máximo y mínimo de píxel.
% % [n_filas,n_cols,n_componentes] = size(imagen)
% [n_filas,n_cols] = size(a); %Para Calcular tamaño de la imagen
% valorPixelMinio = min(min(a));
% valorPixelMaximo = max(max(a));
% % lo anterior para calcular el valor minimo y maximo de toda la imagen.

% %% Operador umbral binario.
% a = imread('grayscaleThermalImage.jpg');
% a = rgb2gray(a);
% thr = 100;
% b = 0 * a;
% b(a >= thr) = 255;
% b = b(86:end,:);
%         figure,subplot(1,2,1),imshow(a);title('Original');colorbar;
%                subplot(1,2,2),imshow(b);title('Modificada');colorbar;

%% Resta

a = imread('scr1.gif');
b = imread('scr2.gif');
c = a - b;
       figure,subplot(1,3,1),imshow(a);title('a');colorbar;
              subplot(1,3,2),imshow(b);title('b');colorbar;
              subplot(1,3,3),imshow(c);title('c');colorbar;
