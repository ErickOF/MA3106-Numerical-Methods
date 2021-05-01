function [w] = vector_eq(y, h)

    n = length(y);
    w = zeros(n, 1);

    if h < 0
        error("h debe ser mayor igual a cero");
    end

    for j = 2:n - 1

        w(j, 1) = (6 / h^2) * (y(j - 1) - 2 * y(j) + y(j + 1));

    end

end
