function [L, Lt] = CholeskyDescomposition(A)
    [n, m] = size(A);

    % Check if is square matrix
    if (n != m)
        error("Square matrix is required");
    end

    % Check symmetry
    if (sum(ne(A, A')) != 0)
        error("Symmetric matrix is required");
    end

    % Check if it's positive definite matrix
    for k = 1:n
        detA = det(A(1:k, 1:k));

        printf("|A(%d)| = %f\n", k, detA);

        if (detA < 0)
            error("Positive definite matrix is required")
        end

    end

    L = zeros(n);

    for row = 1:n

        for col = 1:n

            if (row == col)
                L(col, col) = sqrt(A(row, col) - sum(L(col, 1:col - 1).^2));
            elseif (row > col)
                sumL = sum(L(row, 1:col - 1) .* L(col, 1:col - 1));
                L(row, col) = (1 / L(col, col)) * (A(row, col) - sumL);
            end

        end

    end

    Lt = L';

end
