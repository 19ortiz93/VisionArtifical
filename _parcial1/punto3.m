close all
clear
clc

% Leer las tres imágenes
img1 = imread('figura3img1.jpg');
img2 = imread('figura3img2.jpg');
img3mas = imread('figura3img3.jpg');

% reducir imagen3 a tamaño de las otras imagenes
img3 = imresize(img3mas,[211 218]);

% Convertir las imágenes a escala de grises
img1gray = rgb2gray(img1);
img2gray = rgb2gray(img2);
img3gray = rgb2gray(img3);

% Calcular la diferencia entre las imágenes
cambio_img1_img2 = imabsdiff(img1gray, img2gray);
cambio_img2_img3 = imabsdiff(img2gray, img3gray);
cambio_img1_img3 = imabsdiff(img1gray, img3gray);

% Encontrar regiones sin cambios
sin_cambios = cambio_img1_img2 == 0 & cambio_img2_img3 == 0 & cambio_img1_img3 == 0;

% Encontrar regiones con cambios
con_cambios = ~(cambio_img1_img2 == 0 & cambio_img2_img3 == 0 & cambio_img1_img3 == 0);

% Crear imágenes en blanco y negro con las ROIs
roi_sin_cambios = uint8(sin_cambios) * 255; % Blanco para regiones sin cambios
roi_con_cambios = uint8(con_cambios) * 255; % Blanco para regiones con cambios
cambio_img1_img21 = uint8(cambio_img1_img2) * 255;
cambio_img2_img31 = uint8(cambio_img2_img3) * 255;
cambio_img1_img31 = uint8(cambio_img1_img3) * 255;

% Mostrar las regiones sin cambios y con cambios;
subplot(1, 5, 1);imshow(cambio_img1_img21);title('mivimiento img1 a img2');colormap(gray);
subplot(1, 5, 2);imshow(cambio_img2_img31);title('movimiento img2 a img3');colormap(gray);
subplot(1, 5, 3);imshow(cambio_img1_img31);title('movimiento img1 a img3');colormap(gray)

subplot(1, 5, 4);imshow(roi_sin_cambios);title('Región sin cambios');colormap(gray);
subplot(1, 5, 5);imshow(roi_con_cambios);title('Región con cambios');colormap(gray);