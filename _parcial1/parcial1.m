% Parcial 1
close all
clear
clc

%% Punto 1
% Implemente una función en Matlab que reciba como argumento de entrada un número entero k que
% puede ser 0, 1, 2 o 3. Para cada uno de estos casos, el resultado será que el fondo de la imagen en la
% Figura 1, será ahora de color negro (k = 0), rojo (k = 1), verde (k = 2) o azul (k = 3), respectivamente.

k = round(input('Ingrese un numero entero del 0 al 3: '));
%kint = round(k);

disp(['El número ingresado es: ', num2str(k)]);
figura1 = imread('figura1.jpg');

 if k == 1
     %rgbFigura1 = figura1(:,:,1); % Rojo
     rgbFigura1 = figura1 + 0.1;
 elseif k == 2
     %rgbFigura1 = figura1(:,:,2); % Verde
 elseif k == 3
     %rgbFigura1 = figura1(:,:,3); % Azul
 end

figure,subplot(1,2,1),imshow(figura1);title('Figura1');colorbar
       subplot(1,2,2),imshow(rgbFigura1);title('rgbFigura1');colorbar