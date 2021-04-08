%
function [mSol] = NewtonRaphson(F, x0, variables, maxIter, tol, p, errorType)
    format long g;
    n = length(variables);

    mSol(1, 1) = 0;
    mSol(1, 2:n + 1) = x0;
    mSol(1, n + 2) = inf;

    iter = 1;
    currentError = inf;

    % Compute jacobian matrix
    Jacobian = sym([]);

    for row = 1:n

        for col = 1:n
            Jacobian(row, col) = diff(F(row, 1), variables(col, 1));
        end

    end

    F, Jacobian

    % Newton-Raphson iterations
    while (currentError > tol && maxIter >= iter)
        evaluatedJacobian = [];

        for row = 1:n

            for col = 1:n
                evaluatedJacobian(row, col) = double(subs(Jacobian(row, col), variables, x0));
            end

        end

        evaluatedF = double(subs(F, variables, x0));
        invJacobxF = (evaluatedJacobian^-1) * evaluatedF;

        printf("k = %d con el Jacobiano evaluado en: \n", iter);
        x0, evaluatedJacobian, evaluatedF
        printf("J^-1 * F: \n");
        invJacobxF
        xk = x0 - invJacobxF

        % Type of error
        if (errorType == 1)
            currentError = norm((xk - x0), p) / norm(xk, p)
        else
            currentError = norm((xk - x0), p)
        end

        printf("\n\n");

        mSol(iter + 1, 1) = iter;
        mSol(iter + 1, 2:n + 1) = xk;
        mSol(iter + 1, n + 2) = currentError;

        iter += 1;
        x0 = xk;

    end

end
