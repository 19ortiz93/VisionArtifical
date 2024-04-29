function imagenSalida = contrastStretching(imagenEntrada, a, b)
    % Convertir la imagen de entrada a doble para cálculos
    imagenEntrada = double(imagenEntrada);
    
    % Calcular los valores mínimos y máximos actuales de la imagen (c y d)
    c = min(imagenEntrada(:));
    d = max(imagenEntrada(:));
    
    % Aplicar la fórmula de estiramiento del contraste a cada píxel
    imagenSalida = (b - a) * (imagenEntrada - c) / (d - c) + a;
    
    % Convertir la imagen de salida a uint8 para visualización
    imagenSalida = uint8(imagenSalida);
end