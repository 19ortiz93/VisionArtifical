function imagenFiltrada = aplicarFiltroLaplaciano(img, opcionFiltro)
    
    % Definir los filtros Laplacianos
    filtrosLaplacianos = {
        [0 1 0; 1 -4 1; 0 1 0], % Filtro 1
        [1 1 1; 1 -8 1; 1 1 1],  % Filtro 2
        [0 -1 0; -1 4 -1; 0 -1 0], % Filtro 3 
        [-1 -1 -1; -1 8 -1; -1 -1 -1]  % Filtro 4
    };
    
    % Elegir el filtro según la opción del usuario
    filtroSeleccionado = filtrosLaplacianos{opcionFiltro};
    
    % Identificar partes no quemadas de la imagen
    umbralQuemado = 240;  % Umbral para identificar áreas quemadas
    mascaraNoQuemada = all(img < umbralQuemado, 3);  % Máscara para partes no quemadas
    
    % Preparar imagen de salida
    imagenFiltrada = img;
    
    % Aplicar el filtro Laplaciano a cada canal en las partes no quemadas
    for canal = 1:3
        canalImg = double(img(:, :, canal));
        canalFiltrado = conv2(canalImg, filtroSeleccionado, 'same');
        
        % Solo actualizar píxeles no quemados
        canalImg(mascaraNoQuemada) = canalFiltrado(mascaraNoQuemada);
        
        % Guardar el canal procesado
        imagenFiltrada(:, :, canal) = uint8(canalImg);
    end
end