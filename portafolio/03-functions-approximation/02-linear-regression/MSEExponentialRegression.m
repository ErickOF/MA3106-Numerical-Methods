function [solTable, a, b] = MSEExponentialRegression(x, y)
    solTable = [];
    n = length(x);

    solTable(:, 1) = x;
    solTable(:, 2) = x.^2;
    solTable(:, 3) = log(y);
    solTable(:, 4) = x .* log(y);

    solTable(end + 1, :) = [sum(x), sum(x.^2), sum(log(y)), sum(x .* log(y))];

    printf("Pendiente:\n");
    m = (n * solTable(end, 4) - solTable(end, 1) * solTable(end, 3)) / (n * solTable(end, 2) - solTable(end, 1)^2)

    printf("Intersección:\n");
    b = (solTable(end, 3) - m * solTable(end, 1)) / n

    printf("Y = %fX + %f\n\n", m, b);

    a = e^b;
    b = m;
    printf("y = %fe^%fx\n", a, b);
end
