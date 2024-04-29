
% Imagen de entrada
im = imread('catColor.jpg');
im = rgb2gray(im);
nIp = 4;                           % cuántas intensidades de pixel quiero para mi imagen.
                                   % recomendado que sean potencias de 2
imRes = fnQuantize(im, nIp);

figure,subplot(1,2,1),imshow(im);title('Original');
       subplot(1,2,2),colormap('gray'),imagesc(imRes);title('Modificada');axis('image');
