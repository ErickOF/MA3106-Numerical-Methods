% Newton's Diveded Difference
function [Pn, solTable] = NewtonDividedDifference(x, x0, y0)
    n = length(x0);

    Pn = y0(1);

    solTable = zeros(n, n + 1);
    solTable(:, 1) = x0;
    solTable(:, 2) = y0;
    k = 0;

    for col = 3:n + 1

        for row = 1:n - col + 2
            solTable(row, col) = (solTable(row + 1, col - 1) - solTable(row, col - 1)) / (x0(row + k + 1) - x0(row));
        end

        k += 1;

    end

    for sumIndex = 2:n
        polinom = 1;

        for multIndex = 1:sumIndex - 1
            polinom = polinom * (x - x0(multIndex));
        end

        Pn += solTable(1, sumIndex + 1) * polinom;
    end

end
