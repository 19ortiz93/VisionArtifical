close all
clear
clc

%% problem en las imagenes and.npg y and.npg, detectar la ROI que no se mueve en el par de imagenes.

a = imread('and1.png');
a = rgb2gray(a);
b = imread('and2.png');
b = rgb2gray(b);

%r = a - b;
%para explorar operaciones logicas las imagenes deben ser binarias. Más aun
%las imagenes deben ser booleanas: valores 0 y 1
%thr = 100;
a_bin = ~imbinarize(a); % Método de Otsu para umbralizar la imagen.
b_bin = ~imbinarize(b);

c_bin = a_bin & b_bin;
c_bin = bwareaopen(c_bin,10000);

 % a_bin = 0*a; % imagen del tamaño que a, pero con todos sus pixeles iguales a cero.
 % b_bin = 0*b;
 % a_bin(a >= thr) = 1;
 % b_bin(b >= thr) = 1;

 % problema 1: detectar el objeto que se mueve entre las imagens, y poner el 
 % movimiento relativo entre las dos imagenes, en una sola

 d_bin = (a_bin | b_bin) - c_bin;
 d_bin = bwareaopen(d_bin,1000);

 % problema 2: en un imagen, dejar los píxeles de la ROI que no se mivío,
 % sin cambios. los restantes deben quedar igual a cero;

 e_bin = a.*uint8(c_bin);

    figure,subplot(1,5,1),colormap('gray'),imagesc(a_bin);axis('image');
           subplot(1,5,2),colormap('gray'),imagesc(b_bin);axis('image');
           subplot(1,5,3),colormap('gray'),imagesc(c_bin);axis('image');
           subplot(1,5,4),colormap('gray'),imagesc(d_bin);axis('image');
           subplot(1,5,5),imshow(e_bin);



           