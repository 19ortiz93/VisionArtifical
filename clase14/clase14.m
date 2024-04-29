close all
clear
clc

im = imread("rgbLoro.png");
    figure,imshow(im);

R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);

figure,subplot(1,3,1),imshow(R);title('R');
       subplot(1,3,2),imshow(G);title('G');
       subplot(1,3,3),imshow(B);title('B');
% segmentar la ROI en la parte posterior de la cabelza del ave,
% utilizando el calal de color HSV.

hsv = rgb2hsv(im);
      figure,imshow(hsv);

H = hsv(:,:,1);
S = hsv(:,:,2);
V = hsv(:,:,3);

figure,subplot(1,3,1),colormap('gray'),imagesc(H);title('H');axis image;
       subplot(1,3,2),colormap('gray'),imagesc(S);title('S');axis image;
       subplot(1,3,3),colormap('gray'),imagesc(V);title('V');axis image;

seg = 0*H;
seg(H >= 0.44 & H <= 0.5) = 255;

figure,colormap('gray'),imagesc(seg);title('seg');axis image;