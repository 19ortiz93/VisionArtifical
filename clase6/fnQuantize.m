%fnQuantize
function imRes = fnQuantize(im, nIp)
  % function [argumentos_salida] = nombreFuncion(argumentos_entrada)
  v = 0:255;                         % Vector con las intensidades de pixel de la imagen.
  imRes = 0*im;                      % Imagen resultante: mismo tamaño que la imagen de entrada
  nuevasIP = 0:nIp - 1;              % 
  intervallength = length(v)/nIp;    % numero de elementos que tiene cada intervalo.
  splitv = mat2cell(v, 1, ones(1, numel(v)/intervallength) * intervallength);
  for i = 1:nIp
      intervaloTmp = splitv{1,i};   % Identificar cada intervalo de pixeles
      minTmp = min(intervaloTmp);    % Calcular mínimo de pixel en el intervalo temporal.
      maxTmp = max(intervaloTmp);    % calcular máximo de pixel en el intervalo temporal.
      imRes(im >= minTmp & im <= maxTmp) = nuevasIP(1,i);  % Remplazar por un valor, los pixeles entre mínimo:máximo.
  end
end
