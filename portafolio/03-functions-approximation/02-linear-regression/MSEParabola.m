% Mean Square Error in a Parabola
function [solTable, a, b, c] = MSEParabola(x, y)
    solTable = [];
    n = length(x);

    solTable(:, 1) = x;
    solTable(:, 2) = x.^2;
    solTable(:, 3) = x.^3;
    solTable(:, 4) = x.^4;
    solTable(:, 5) = y;
    solTable(:, 6) = x .* y;
    solTable(:, 7) = (x.^2) .* y;

    solTable(end + 1, :) = [sum(x), sum(x.^2), sum(x.^3), sum(x.^4), sum(y), sum(x .* y), sum((x.^2) .* y)];

    A = [n, solTable(end, 1), solTable(end, 2);
         solTable(end, 1), solTable(end, 2), solTable(end, 3);
         solTable(end, 2), solTable(end, 3), solTable(end, 4)];
    b = [solTable(end, 5); solTable(end, 6); solTable(end, 7)];

    coeff = A \ b;

    a = coeff(1);
    b = coeff(2);
    c = coeff(3);
end
