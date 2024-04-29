% Cargar la imagen
img = imread('Tomatoes.jpg');

% Convertir a escala de grises
grayImg = rgb2gray(img);

% Aplicar umbral binario para segmentar los tomates
binaryImg = grayImg > 50;

% Eliminar objetos pequeños (ruido)
cleanedBinaryImg = bwareaopen(binaryImg, 500);

% Etiquetar componentes conectados
[labeledImg, numTomates] = bwlabel(cleanedBinaryImg);

% Detectar grietas utilizando detección de bordes y dilatación
edges = edge(grayImg, 'Sobel');
dilatedEdges = imdilate(edges, strel('disk', 2));
grietasLabel = bwlabel(dilatedEdges);

% Crear una imagen de superposición con las áreas agrietadas resaltadas
overlayImg = img;
for i = 1:numTomates
    mascaraTomate = labeledImg == i;
    grietasEnTomate = mascaraTomate & dilatedEdges;
    overlayImg(grietasEnTomate) = 255; % Resaltar en blanco
end

% Mostrar la imagen original con las áreas agrietadas resaltadas
figure;
imshow(overlayImg);
title('Tomates con áreas agrietadas resaltadas');

% Calcular el porcentaje de superficie agrietada (como se hizo antes)

% ...

% Mostrar el porcentaje de superficie agrietada
disp('Porcentaje de superficie agrietada para cada tomate:');
disp(porcentajeAgrietado);

