close all
clear
clc
%% Submuestreo de una image. Iterpolación mediante promedio de una ROI.
  a = imread('happy_dog.jpg'); %remplazar por laimagen
  b = rgb2gray(a); 
  im = imresize(b,[2973 2082]); % Acortar o escalar a un tamallo que sea múltiplo de 3,
nada = zeros(size(im)/3);

 rowC = 1;

 [nf,nc] = size(im); % nf = número de filas y nc = número de columnas.
for i = 2:3:nf - 1

 colC = 1;    
for j = 2:3:nc - 1
            roi = im(i - 1:i + 1,j - 1:j + 1);
nada(rowC,colC) = mean(mean(roi));
           colC = colC + 1;
end
           rowC = rowC + 1;
end
figure,imshow(uint8(im));title('Imagen original');
figure,imshow(uint8(nada));title('Imagen modificada');