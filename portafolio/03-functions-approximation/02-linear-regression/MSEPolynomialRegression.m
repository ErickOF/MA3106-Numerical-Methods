function [solTable, a, b] = MSEPolynomialRegression(x, y)
    solTable = [];
    n = length(x);

    solTable(:, 1) = log(x);
    solTable(:, 2) = log(x).^2;
    solTable(:, 3) = log(y);
    solTable(:, 4) = log(x) .* log(y);

    solTable(end + 1, :) = [sum(log(x)), sum(log(x).^2), sum(log(y)), sum(log(x) .* log(y))];

    printf("Pendiente:\n");
    m = (n * solTable(end, 4) - solTable(end, 1) * solTable(end, 3)) / (n * solTable(end, 2) - solTable(end, 1)^2)

    printf("Intersección:\n");
    b = (solTable(end, 3) - m * solTable(end, 1)) / n

    printf("Y = %fX + %f\n\n", m, b);

    a = e^b;
    b = m;
    printf("y = %fx^%f\n", a, b);
end
