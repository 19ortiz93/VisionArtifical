close all
clear
clc

a = imread('Fruits.png');
    figure,imshow(a);

    hsv = rgb2hsv(a);
    h = hsv(:,:,1);
    s = hsv(:,:,2);
    v = hsv(:,:,3);

    figure,imagesc(h);
    figure,imagesc(s);
    figure,imagesc(v);

    %vSeg = imsegkmeans(v,2);
           %figure,imagesc(vSeg);