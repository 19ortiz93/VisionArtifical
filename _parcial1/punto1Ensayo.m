% Parcial 1
close all
clear
clc

k = round(input('Ingrese un numero entero del 0 al 3: '));
%kint = round(k);

disp(['El número ingresado es: ', num2str(k)]);

% Leer la imagen
img1 = imread('figura1.jpg');
%img1gray = rgb2gray(img1);
% Asegurar que la imagen está en formato uint8 para que los valores estén entre 0 y 255
img = im2uint8(img1);
    
 % Identificar píxeles de fondo (blanco)
 % Consideramos un píxel como blanco si todos sus canales (R, G, B) tienen valores de 255
 esFondoBlanco = img(:,:,1) == 255 & img(:,:,2) == 255 & img(:,:,3) == 255;
    
 % Preparar la máscara para aplicar el nuevo color de fondo
 mascaraFondo = repmat(esFondoBlanco, [1, 1, 3]);
    
 % Definir el nuevo color de fondo según k
switch k
   case 0
       nuevoColor = [0, 0, 0]; % Negro
   case 1
       nuevoColor = [255, 0, 0]; % Rojo
   case 2
       nuevoColor = [0, 255, 0]; % Verde
   case 3
       nuevoColor = [0, 0, 255]; % Azul
   otherwise
       error('El valor de k debe ser 0, 1, 2, o 3.');
end
    
% Cambiar el color de fondo
for canal = 1:3
  canalImg = img(:,:,canal);
  canalImg(esFondoBlanco) = nuevoColor(canal);
  img(:,:,canal) = canalImg;
end
    
% Mostrar la imagen modificada
figure,subplot(1,2,1),imshow(img1);title('Figura1');colorbar
       subplot(1,2,2),imshow(img);title('rgbFigura1');colorbar