close all
clear
clc

im = imread("celulas.jpg");
    figure,imshow(im);

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