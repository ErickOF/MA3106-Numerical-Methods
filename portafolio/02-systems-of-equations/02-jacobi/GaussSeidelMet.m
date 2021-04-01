function [mSol] = GaussSeidelMet(A, b, x0, itermax, tol, p)
    n = length(A);

    D = diag(diag(A));
    L = tril(A) - D;
    U = triu(A) - D;

    T = inv(D + L) * -U;
    c = inv(D + L) * b;

    errorRelativo = tol + 1;
    cont = 1;

    mSol(cont, 1) = cont;
    mSol(cont, 2:n + 1) = x0;
    mSol(cont, n + 2) = errorRelativo;

    while (tol < errorRelativo && cont < itermax)
        cont += 1;
        x0 = T * x0 + c;

        mSol(cont, 1) = cont;
        mSol(cont, 2:n + 1) = x0;

        errorRelativo = norm(mSol(cont, 2:n + 1) - mSol(cont - 1, 2:n + 1), p) / norm(mSol(cont, 2:n + 1), p);

        mSol(cont, n + 2) = errorRelativo;
    end
end
