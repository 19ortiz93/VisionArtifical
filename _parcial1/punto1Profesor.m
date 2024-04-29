close all
clear
clc

%% P2

im = imread('figura2.jpg');
im = rgb2gray(im);
    %figure,imshow(im);
    

l = im(:,:,1);
a = im(:,:,2);
b = im(:,:,3);

figure,subplot(1,3,1),imshow(l);
       subplot(1,3,2),imshow(a);
       subplot(1,3,3),imshow(b);


% r = im(:,:,1);
% g = im(:,:,2);
% b = im(:,:,3);

% figure,subplot(1,3,1),imshow(r);
%        subplot(1,3,2),imshow(g);
%        subplot(1,3,3),imshow(b);



