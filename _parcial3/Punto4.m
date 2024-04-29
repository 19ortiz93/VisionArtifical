close all
clear
clc 

% Cargar la imagen
I = imread('I1.jpeg');

% Convertir la imagen a escala de grises
grayImage = rgb2gray(I);

% Umbralizar la imagen para segmentar los granos de tipo 1 y 2
grainsBW = grayImage < 100;

% Usar regionprops para medir el área de los granos
grainsStats = regionprops(grainsBW, 'Area');
totalGrainArea = sum([grainsStats.Area]);

% Umbralizar la imagen para segmentar el fondo
backgroundBW = grayImage > 180;

% Medir el área del fondo
backgroundStats = regionprops(backgroundBW, 'Area');
totalBackgroundArea = sum([backgroundStats.Area]);

% Calcular porcentajes
imageArea = numel(grayImage);
grainPercentage = (totalGrainArea / imageArea) * 100;
backgroundPercentage = (totalBackgroundArea / imageArea) * 100;
type2Percentage= 100 - grainPercentage - backgroundPercentage;

fprintf('Granos de tipo 1: %.2f%%\n', grainPercentage);
fprintf('Granos de tipo 2: %.2f%%\n', type2Percentage);
fprintf('Fondo: %.2f%%\n', backgroundPercentage);