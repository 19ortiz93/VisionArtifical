% Cargar la imagen
img = imread('I1.jpeg');

% Convertir a escala de grises
grayImg = rgb2gray(img);

% Ajustar el contraste (si es necesario)

% Define los valores de umbral (ajústalos según tu imagen)
thresholdGrain1 = [50, 100]; % Ejemplo: ajusta estos valores
thresholdGrain2 = [110, 150]; % Ejemplo: ajusta estos valores
thresholdBackground = [10, 40]; % Ejemplo: ajusta estos valores

% Segmentar granos y fondo
grain1Mask = grayImg >= thresholdGrain1(1) & grayImg <= thresholdGrain1(2);
grain2Mask = grayImg >= thresholdGrain2(1) & grayImg <= thresholdGrain2(2);
backgroundMask = grayImg >= thresholdBackground(1) & grayImg <= thresholdBackground(2);

% Operaciones morfológicas (limpieza, adelgazamiento, relleno)

% Calcular áreas
areaGrain1 = sum(grain1Mask(:));
areaGrain2 = sum(grain2Mask(:));
areaBackground = sum(backgroundMask(:));

% Calcular área total de la imagen
totalArea = numel(grayImg);

% Calcular porcentajes
porcentajeGrano1 = (areaGrain1 / totalArea) * 100;
porcentajeGrano2 = (areaGrain2 / totalArea) * 100;
porcentajeFondo = (areaBackground / totalArea) * 100;

disp('Porcentaje de área para cada componente:');
disp(['Grano de tipo 1: ', num2str(porcentajeGrano1), '%']);
disp(['Grano de tipo 2: ', num2str(porcentajeGrano2), '%']);
disp(['Fondo: ', num2str(porcentajeFondo), '%']);
