close all 
clear 
clc

% Leer la imagen
imagenOriginal = imread("gatoP2.jpg");

% Mostrar la imagen original
figure;
imshow(imagenOriginal);
title('Imagen Original');

% Permitir al usuario elegir qué mitad de la imagen procesar
prompt = '¿Qué mitad de la imagen deseas procesar? (izquierda/derecha): ';
lado = lower(input(prompt, 's'));

% Verificar la entrada del usuario
if strcmp(lado, 'izquierda')
    ladoProcesado = imagenOriginal(:, 1:size(imagenOriginal, 2)/2, :);
    ladoNoProcesado = imagenOriginal(:, size(imagenOriginal, 2)/2 + 1:end, :);
elseif strcmp(lado, 'derecha')
    ladoProcesado = imagenOriginal(:, size(imagenOriginal, 2)/2 + 1:end, :);
    ladoNoProcesado = imagenOriginal(:, 1:size(imagenOriginal, 2)/2, :);
else
    error('¡Entrada no válida! Debe ser "izquierda" o "derecha".');
end

% Permitir al usuario elegir si quiere que la mitad procesada esté en escala de grises o en color
prompt = '¿Quieres que la mitad procesada esté en escala de grises o en color? (gris/color): ';
colorElegido = lower(input(prompt, 's'));

% Verificar la entrada del usuario
if strcmp(colorElegido, 'gris')
    ladoProcesado = rgb2gray(ladoProcesado);
    ladoProcesado = cat(3, ladoProcesado, ladoProcesado, ladoProcesado); % Convertir a escala de grises
elseif ~strcmp(colorElegido, 'color')
    error('¡Entrada no válida! Debe ser "gris" o "color".');
end

% Aplicar un filtro pasa-bajos a la mitad seleccionada
ladoFiltrado = imgaussfilt(ladoProcesado, 7); % Se utiliza un filtro Gaussiano como ejemplo

% Combinar la mitad procesada y la mitad no procesada para obtener la imagen completa
if strcmp(lado, 'izquierda')
    imagenProcesada = [ladoFiltrado, ladoNoProcesado];
elseif strcmp(lado, 'derecha')
    imagenProcesada = [ladoNoProcesado, ladoFiltrado];
end

% Mostrar la imagen procesada
figure;
imshow(imagenProcesada);
title('Imagen Procesada');

