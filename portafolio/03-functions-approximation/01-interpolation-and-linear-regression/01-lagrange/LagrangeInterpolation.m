% Lagrange Interpolation
function Pn = LagrangeInterpolation(x, x0, y0)
    n = length(x0);

    Pn = 0;

    for sumIndex = 1:n
        printf("L%d\n = ", sumIndex - 1);
        productResult = 1;
        constantResult = 1;

        for prodIndex = 1:n

            if (sumIndex != prodIndex)
                polynomial = x - x0(prodIndex);
                constant = x0(sumIndex) - x0(prodIndex);
                productResult *= polynomial;
                constantResult *= constant;
            end

        end

        productResult, 1 / constantResult
        Pn += y0(sumIndex) * productResult / constantResult;

    end

    return;

end
