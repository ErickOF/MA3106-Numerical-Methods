function [x] = Cholesky(A, b)
    n = length(A);
    L = [];
    Lt = [];

    try
        [L, Lt] = CholeskyDescomposition(A)
    catch err
        printf("%s\n", err.message);
        printf("\nTransforming matrix...\n");
        At = A';
        A = At * A
        b = At * b

        [L, Lt] = CholeskyDescomposition(A)
    end

    % Forward substitution
    y = zeros(n, 1);

    for row = 1:n
        y(row) = (b(row) - L(row, 1:row) * y(1:row)) / L(row, row);

        printf("y(%d) = %f\n", row, y(row));
    end

    printf("\n");

    % Backward substitution
    x = zeros(n, 1);

    for row = n:-1:1
        col = row + 1;
        x(row) = (y(row) - Lt(row, col:end) * x(col:end)) / Lt(row, row);

        printf("x(%d) = %f\n", row, x(row));
    end

end
