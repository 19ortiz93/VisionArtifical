close all
clear
clc 

% Cargar la imagen
img = imread('Tomatoes.jpg');

% Convertir la imagen a escala de grises
grayImg = rgb2gray(img);

% Aplicar un umbral binario para segmentar los tomates del fondo
binaryImg = imbinarize(grayImg, graythresh(grayImg));

% Eliminar pequeños objetos que no son tomates
cleanedBinaryImg = bwareaopen(binaryImg, 500);

% Etiquetar componentes conectados
[labeledImg, numTomatoes] = bwlabel(cleanedBinaryImg);

% Identificar y etiquetar las grietas usando detección de bordes u otro método adecuado 
cracks = edge(grayImg,'sobel');
cracks = imdilate(cracks, strel('disk',2));

% Inicializar la variable para almacenar el porcentaje total de las regiones agrietadas
totalCrackPercentage = 0;

for i=1:numTomatoes
    
    % Crear una máscara para cada tomate 
    tomatoMask = labeledImg == i;
    
    % Calcular el área total del tomate (excluyendo las hojas si es necesario)
    totalArea = sum(tomatoMask(:));
    
    % Calcular el área de las grietas dentro de cada máscara de tomate 
    crackArea = sum(cracks(:) & tomatoMask(:));
    
    % Calcular el porcentaje del área de las grietas 
    crackPercentage = (crackArea / totalArea) * 100;
    
    % Sumar el porcentaje del área de las grietas al porcentaje total
    totalCrackPercentage = totalCrackPercentage + crackPercentage;
    
end

% Calcular el porcentaje total de las regiones agrietadas
totalCrackPercentage = totalCrackPercentage / numTomatoes;

% Mostrar la imagen original con el porcentaje total de las regiones agrietadas
figure; imshow(img); hold on;

text(size(img,2)/2,10,sprintf('Porcentaje total de las regiones agrietadas: %.2f%%',totalCrackPercentage),...
    'Color','black','FontSize',12,'FontWeight','bold');

hold off;