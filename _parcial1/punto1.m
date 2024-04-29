close all
clear
clc

% Leer la imagen
imagen = imread('figura1.jpg');
img1 = imagen;
%asignar valor a k
k = round(input('Ingrese un numero entero del 0 al 3: '));
     % Fondo negro
switch k
   case 0
       % Fondo negro
       imagen(:,:,1) = 0;
       imagen(:,:,2) = 0;
       imagen(:,:,3) = 0;
   case 1
       % Fondo rojo
       imagen(:,:,2) = 0; % Establecer el canal verde en cero
       imagen(:,:,3) = 0; % Establecer el canal azul en cero
   case 2
       % Fondo verde
       imagen(:,:,1) = 0;
       imagen(:,:,3) = 0;
   case 3
       % Fondo azul
       imagen(:,:,1) = 0;
       imagen(:,:,2) = 0;
end

% Mostrar la imagen con el nuevo fondo
figure,subplot(1,2,1),imshow(img1);title('Figura original');colorbar
       subplot(1,2,2),imshow(imagen);title('Figura RGB');colorbar