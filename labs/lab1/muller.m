function [d, k, err] = muller(d0, d1, d2, tol, iterMax)
    D = [d0 d1 d2];
    Y = [func(D(1)) func(D(2)) func(D(3))];

    for k = 1:iterMax
        h0 = D(1) - D(3);
        h1 = D(2) - D(3);

        e0 = Y(1) - Y(3);
        e1 = Y(2) - Y(3);

        denom = h1 * h0^2 - h0 * h1^2;

        % Coeficientes
        a = (e0 * h1 - e1 * h0) / denom;
        b = (e1 * h0^2 - e0 * h1^2) / denom;
        c = Y(3);

        % Discriminante
        disc = b^2 - 4 * a * c;

        if disc > 0
            disc = sqrt(disc);
        else
            disc = 0;
        end

        if b < 0
            disc = -disc;
        end

        z = -2 * c / (b + disc);
        d = D(3) + z;

        if abs(d - D(2)) < abs(d - D(1))
            D = [D(2) D(1) D(3)];
            Y = [func(D(1)) func(D(2)) func(D(3))];
        end

        if abs (d - D(3)) < abs(d - D(2))
            D = [D(1) D(3) D(2)];
            Y = [func(D(1)) func(D(2)) func(D(3))];
        end

        D(3) = d;
        Y(3) = func(D(3));
        y = Y(3);

        % Calcular el error
        err = abs(y);

        if (err < tol)
            break
        end
    end
end
