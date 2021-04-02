function [mSol] = JacobiMet(A, b, x0, itermax, tol, p)
    n = length(A);

    cont = 1;
    errorRelativo = tol + 1;

    mSol(cont, 1) = cont - 1;
    mSol(cont, 2:n + 1) = x0;
    mSol(cont, n + 2) = errorRelativo;

    while (tol < errorRelativo && cont <= itermax)
        cont += 1;
        x1 = zeros(n, 1);

        for fila = 1:n
            suma = 0;

            for col = 1:n

                if (fila != col)
                    suma += A(fila, col) * x0(col, 1);
                end

            end

            x1(fila, 1) = (b(fila, 1) - suma) / A(fila, fila);
        end

        mSol(cont, 1) = cont - 1;
        mSol(cont, 2:n + 1) = x1;

        errorRelativo = norm(x1 - x0, p) / norm(x1, p);
        mSol(cont, n + 2) = errorRelativo;

        x0 = x1;
    end

end
