clearvars;

% Cargar la imagen
img = imread('Ironstone.jpg');

% Convertir la imagen a doble precisión
img = im2double(img);

% Identificar las regiones con alto contenido de hierro por su color rojo
mask = img(:,:,1) > 0.28 & img(:,:,2) < 0.3 & img(:,:,3) < 0.25;

% Crear una máscara para estas regiones
ironRegions = repmat(mask, [1, 1, 3]);

% Crear una copia de la imagen original
highlightedImg = img;

% Resaltar las regiones de hierro invirtiendo los colores
highlightedImg(ironRegions) = 1.0 - img(ironRegions);

% Mostrar las imágenes original y resaltada lado a lado para comparar
figure;
subplot(1,2,1), imshow(img), title('Imagen Original');
subplot(1,2,2), imshow(highlightedImg), title('Regiones de Hierro Resaltadas');