close all
clear
clc

% Se lee la imagen
img = imread('Ironstone.jpg');

% convierte la imagen cargada a valores de píxeles de tipo double, 
% lo que significa que los valores de los píxeles estarán en el rango de 0 a 1 en lugar del rango de 0 a 255.
img = im2double(img);

% Se crea una máscara que identifica las regiones de la imagen que tienen
% un alto contenido de hierro.
% se comparan los valores rgb 
mascara = img(:,:,1) > 0.3 & img(:,:,2) < 0.3 & img(:,:,3) < 0.35;

% lo que se hace es replicar la mascara en la 3ra dimension 3 veces en la
% primera y segunda una sola vez dando como resultado una matriz
% tridimensional donde la mascara se repite en cada capa
regionesHierro = repmat(mascara, [1, 1, 3]);

% Crear una copia de la imagen original
imagenCopia = img;

% Resaltar las regiones de hierro invirtiendo los colores
imagenCopia(regionesHierro) = 1.0 - img(regionesHierro);

% Mostrar las imágenes original y resaltada lado a lado para comparar
figure;
subplot(1,2,1), imshow(img), title('Imagen Original');
subplot(1,2,2), imshow(imagenCopia), title('Regiones de Hierro Resaltadas');