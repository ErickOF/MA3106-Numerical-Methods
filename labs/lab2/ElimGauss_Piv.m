function [x] = ElimGauss_Piv(A, b, piv)
    format rat;
    n = length(A);
    x = zeros(length(b), 1);

    % Eliminacion hacia adelante
    for k = 1:n - 1
        if piv != 0
            [A, b] = Pivoteo(A, b, k);
        end

        for fila = k + 1:n
            factor = A(fila, k) / A(k, k);
            A(fila, :) -= factor * A(k, :);

            % Cambiar vector de constantes
            b(fila) -= factor * b(k);
        end
    end

    % Sustitucion hacia atras
    for fila = n:-1:1
        col = fila + 1;
        suma = A(fila, col:end) * x(col:end);

        x(fila) = (b(fila) - suma) / A(fila, fila);
    end
end
