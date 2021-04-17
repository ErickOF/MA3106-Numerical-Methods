% Lagrange Interpolation
function Pn = LagrangePolin(x, Node)
    n = length(Node);

    Pn = 0;

    for sumIndex = 1:n
        printf("L%d\n = ", sumIndex - 1);
        productResult = 1;
        constantResult = 1;

        for prodIndex = 1:n

            if (sumIndex != prodIndex)
                polynomial = x - Node(prodIndex, 1);
                constant = Node(sumIndex, 1) - Node(prodIndex, 1);
                productResult *= polynomial;
                constantResult *= constant;
            end

        end

        productResult, 1 / constantResult
        Pn += Node(sumIndex, 2) * productResult / constantResult;

    end

    return;

end
