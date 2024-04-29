close all
clear
clc
% Procedimientoo: binarizar la imagen, de modo que queden las ROI de las
% monedas de color blanco y el fondo de color negro.
% Garantizar que hallan 8 ROI
% Determinar de forma automatica, el numero de ROIs.
%Caraterización:
% Generar una matriz de caracteristica: nROIs x 256.
% Cada fila de la matriz de caracteristicas es el histograma de la ROI que
% encierra una moneda.
%% Clustering de la matriz de caracteristicas, usando kmeans. 2 grupos.
%% Visualización: mostrar las monedas de cada clase con un color diferente en una imagen final.

%para la monedas3.jpg
% para segementar las monedas:
%pueden utilizar algoritmo de contornos activos.
% Pueden intentar una umbralización, pero el resultado toca aplicarle
% morfología matemática.

