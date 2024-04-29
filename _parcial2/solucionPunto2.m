close all
clear
clc

a = imread('hojaQuemadaP3.jpg');
     figure,imshow(a);
filtro = [0 1 0;1 -4 1;0 1 0];

hsv = rgb2hsv(a);
h = hsv(:,:,1);
s = hsv(:,:,2);
v = hsv(:,:,3);

figure,colormap('jet'),imagesc(h);axis image;
figure,colormap('jet'),imagesc(s);axis image;
figure,colormap('jet'),imagesc(v);axis image;

%% Obtener una máscara para hallar la región quemada de la hoja
thr1 = 0.08;
thr2 = 0.5;
mascara = 0*h;
mascara(h >= thr2) = 2;
mascara(h <= thr1) = 1;
% mascara = bwareaopen(mascara, 500);
figure,colormap('gray'),imagesc(mascara);axis image;

%% Convolución entre la imagen y el filtro, para la ROI (región quemada)
r = a(:,:,1);
g = a(:,:,2);
b = a(:,:,3);

rF = conv2(r,filtro,'same');
gF = conv2(r,filtro,'same');
bF = conv2(r,filtro,'same'); 

rF(mascara ~= 0) = r(mascara ~= 0);
gF(mascara ~= 0) = g(mascara ~= 0);
bF(mascara ~= 0) = b(mascara ~= 0);

rgbF = cat(3,rF,gF,bF);
       figure,imagesc(rgbF);axis image;
       figure,imshow(uint8(rgbF));