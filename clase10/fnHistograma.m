function vecHistograma = fnHistograma(imagenEntrada)
    vecHistograma = zeros(1,256); % vector fila de 1 x 256
    for intensidadPixel = 0:255
        frecTemporal = length(find(imagenEntrada == intensidadPixel));
        vecHistograma(1, intensidadPixel +1) = frecTemporal;
    end
end

% En el script que invoca la funcion...
% close; clear all; clc
% imagen = imread(imagen.jpg);
