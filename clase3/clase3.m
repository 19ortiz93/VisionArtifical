close all
clear
clc


a = imread("a53d046c495341e8353f9c527c2fc8d1.jpg");
a = rgb2gray(a);
tp=10;

c = a(1:tp:end,1:tp:end); % que operacion se esta gaciendo

%%hacer el mismo submuestreo, para la imagen RGB