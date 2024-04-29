close all
clear
clc

a = imread('Tostadas.png');
    figure,imshow(a);

    hsv = rgb2hsv(a);
    h = hsv(:,:,1);
    s = hsv(:,:,2);
    v = hsv(:,:,3);

        figure,imagesc(s);
        thr = 0.08;
        sMod = 0*s;      
        sMod(s <=thr) = 255;
        sMod = double(~sMod);
        sMod = double(bwareaopen(sMod,1000));
        sMod = double(imfill(sMod,'holes'));

        ee = strel('disk',21,0); % un kernel circula de ratio 15 pixeles para
        %erosionar el contorno de las ROI
        sModEroded = double(imerode(sMod,ee)); %erosion morfologica: es para reducir
        %el contorno de las ROI

        figure,colormap('gray'),imagesc(sMod);axis image;
        figure,colormap('gray'),imagesc(sModEroded);axis image;

        %Etapa de caracterizacion
        mascara = sMod;
        mascaraEt = bwlabel(mascara);
        nROI = max(max(mascaraEt));


        FeatMatriz = zeros(nROI,256);

        for i = 1:1 %nROI
          imagenTmp = double(rgb2gray(a));  
          imagenTmp(mascaraEt ~= i) = -1;
          FeatMatriz(i,:) = fnHistograma(imagenTmp);
          %figure,imshow(imagenTmp);
        end
        idx = kmeans(FeatMatriz,2);