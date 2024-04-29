% Cargar imagen de bajo contraste
imagenEntrada = imread('paisajeBajoContraste.PNG');
%imagenEntradaGray = rgb2gray(imagenEntrada);

% Mejorar el contraste de la imagen
imagenMejorada = contrastStretching(imagenEntradax, 0, 255);

% Mostrar la imagen original y la imagen mejorada
figure,subplot(1, 2, 1),imshow(imagenEntrada),title('Imagen Original');
       subplot(1, 2, 2),imshow(imagenMejorada),title('Imagen con Contraste Mejorado');