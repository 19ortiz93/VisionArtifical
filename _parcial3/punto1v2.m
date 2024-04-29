close all
clear
clc 

imagen = imread('Ironstone.jpg');

imagen = im2double(imagen);

R = imagen(:,:,1);
G = imagen(:,:,2);
B = imagen(:,:,3);


umbral_hierro = R ./ (R + G + B);

umbral = 0.42;

mascara = umbral_hierro >= umbral;


mascara = imfill(mascara,'holes');

mascara = bwareaopen(mascara,1000);

R(mascara == 1) = 1 - R(mascara);
G(mascara == 1) = 1 - G(mascara);
B(mascara == 1) = 1 - B(mascara);

imagen_invertida = cat(3, R, G, B);

figure,subplot(1,2,1),imshow(imagen);title('Imagen original');

subplot(1,2,2),imshow(imagen_invertida),title('Imagen con colores invertidos');