close all
clear
clc

% Cargar la imagen
img = imread('figura2.jpg');
 
% Definir la región de interés (ROI) de color verde
limiteInferiorVerde = [0, 100, 0]; % Limite inferior de verde (en RGB)
limiteSuperiorVerde = [100, 255, 100]; % Limite superior de verde (en RGB)

% Obtener las dimensiones de la imagen
[filas, columnas, ~] = size(img);

% Inicializar una matriz de máscara para identificar los píxeles en la ROI de color verde
mascaraROIverde = false(filas, columnas);

% Iterar sobre cada píxel de la imagen y marcar los píxeles dentro de la ROI de color verde
for fila = 1:filas
    for columna = 1:columnas
        pixel_actual = squeeze(double(img(fila, columna, :)));
        if all(pixel_actual >= limiteInferiorVerde & pixel_actual <= limiteSuperiorVerde)
            mascaraROIverde(fila, columna) = true;
        end
    end
end
 
% Aplicar cuantización de color solo a los píxeles dentro de la ROI de color verde
imagenCuantizada = img;
imagenCuantizada(~mascaraROIverde) = 0; % Establecer a cero los píxeles fuera de la ROI
 
% Mostrar la imagen original y la imagen con la ROI cuantizada lado a lado
figure;subplot(1, 2, 1);imshow(img);title('Imagen Original');colorbar
       subplot(1, 2, 2);imshow(imagenCuantizada);title('ROI de color verde cuantizada');colorbar


