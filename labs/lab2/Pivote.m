function [A, b] = Pivoteo(A, b, k)
    n = length(A);
    valoresRelativos = zeros(n, 1);

    for fila = k:n
        valoresRelativos(fila) = abs(A(fila, k)) / max(abs(A(fila, :)));
    end

    [~, f] = max(valoresRelativos);

    A([k, f], :) = A([f, k], :);
    b([k, f]) = b([f, k]);
end
