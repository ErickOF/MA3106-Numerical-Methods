% Mean Square Error in Linear Regression
function [solTable, m, b] = MSELinearRegression(x, y)
    solTable = [];
    n = length(x);

    solTable(:, 1) = x;
    solTable(:, 2) = x.^2;
    solTable(:, 3) = y;
    solTable(:, 4) = x .* y;

    solTable(end + 1, :) = [sum(x), sum(x.^2), sum(y), sum(x .* y)];

    m = (n * solTable(end, 4) - solTable(end, 1) * solTable(end, 3)) / (6 * solTable(end, 2) - solTable(end, 1)^2);

    b = (solTable(end, 3) - m * solTable(end, 1)) / n;
end
