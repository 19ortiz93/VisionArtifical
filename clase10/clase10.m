close all
clear
clc

%% tema general: histograma de una imagen
% es un conteo de frecuencias de las intensidades de pixel de la imagen.
% problema 1: obtencion de una imagen

imagen = imread('oscura.jpg');
imagenEntrada = rgb2gray(imagen);
figure,imshow(imagenEntrada);
vecHist = fnHistograma(imagenEntrada);

figure,bar(1:length(vecHist),vecHist);grid on;
       xlabel('Intensidad de pixel.');ylabel('Frecuencia');

% contraste: capacidad para reconocer simultaneamente pixeles oscuros y
% claros.

% ¿Qué relación hay entre el rango dinamico de una imagen. el contraste de
% esta y la forma del histograma (de la imagen)

% si la imagen tiene alto contraste, hay conteos de frecuencia a lo largo
% de (en general, casi todo) el rando dinamico.

% si la imagen tiene bajo contraste, los conteos suelen estar concentrados
% en regiones del rango dinamico.

% si los conteos de frecuencia de una iamgen se concentran hacia la derecha
% o la izquierda, entonces la imagen sera claro u oscuro, respectivamente.

% verificar que si la imagen es de bajo contraste y es oscura, la
% concentracion en el histograma tiende hacia la izquierda.

% El rango dinamico se refiere a la diferencia entre las intensidades de
% pixel mnima y maxima de una imagen.

% contrast stretching. es una tecnica mediante la cual se modifican las
% intensidades de pixel de la imagen, para que aumente el contraste. El
% efecto sobre el histograma, es que ahora luce "estirado".

% cuando la imagen tiene su histograma aplanado, tambien suele exhibir alto
% contraste. un histograma aplanado es caracteristico de una distribución
% de probabilidad uniforme.

% Ejercicio: utilizar histeq.m para ecualizar el histograma de una imagen
% de bajo contrast. Mostrar las imagenes antes y despues de la
% ecualizacipon  del histograma, y mostrar los histogramas en cada caso.

