close all
clear
clc 

% Leer la imagen
imagen = imread('Neutrophil2.jpg');

% Convertir la imagen a escala de grises
imagenGris = rgb2gray(imagen);

% Aplicar un filtro mediano para reducir el ruido
imagenFiltrada = medfilt2(imagenGris, [3 3]);

% Umbralizar la imagen para segmentar los glóbulos rojos y el neutrófilo
umbral = graythresh(imagenFiltrada);
imagenBinaria = imbinarize(imagenFiltrada, umbral);
imshow(imagenBinaria), title('Imagen Blanca y Negra');

% Eliminar el neutrófilo utilizando operaciones morfológicas
se = strel('disk', 7);
imagenSinNeutrofilo = imopen(imagenBinaria, se);
imshow(imagenSinNeutrofilo), title('imagen sin neutrofilo');

% Etiquetar los componentes conectados (glóbulos rojos)
[etiquetado, numero] = bwlabel(imagenSinNeutrofilo);

% Mostrar la imagen original y la segmentación
figure;subplot(1,2,1), imshow(imagen), title('Imagen Original');
       subplot(1,2,2), imshow(label2rgb(etiquetado)), title('Segmentación de Glóbulos Rojos');