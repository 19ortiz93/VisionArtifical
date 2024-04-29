close all
clear
clc

img = imread('figura2.jpg');
img1 = rgb2gray(img);

img_bin = ~imbinarize(img1);


figure,subplot(1,1,1),colormap('gray'),imagesc(img_bin);axis('image');