% Solicitar al usuario que ingrese un valor para k hasta que sea válido
k = -1; % Inicializar k con un valor no válido
while ~ismember(k, [0, 1, 2, 3])
    k = input('Ingrese un valor para k (0 = negro, 1 = rojo, 2 = verde, 3 = azul): ');
    if ~ismember(k, [0, 1, 2, 3])
       disp('Valor inválido para k. Por favor, ingrese 0, 1, 2, o 3.');
    end
end

% Leer la imagen si imagen es un nombre de archivo
img = imread(imagen);

% Convertir la imagen a escala de grises para binarización
imgGray = rgb2gray(img);

% Binarizar la imagen para identificar el fondo
    mask = ~imbinarize(imgGray);

    % Preparar la nueva imagen con el mismo tamaño que la original
    newImg = img;

    % Definir colores de fondo según k: negro, rojo, verde, azul
    colores = [0, 0, 0; 255, 0, 0; 0, 255, 0; 0, 0, 255];

    % Aplicar el color de fondo seleccionado según el valor de k
    for c = 1:3 % Recorrer cada canal de color: R, G, B
        canal = newImg(:,:,c); % Extraer el canal actual
        canal(mask) = colores(k+1, c); % Cambiar los píxeles de fondo en este canal
        newImg(:,:,c) = canal; % Guardar los cambios en la imagen nueva
    end

    % Mostrar la imagen modificada
    imshow(newImg);