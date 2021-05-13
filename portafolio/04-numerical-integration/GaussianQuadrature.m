% Gaussian Quadrature
function [gq] = GaussianQuadrature(low, high, derivatives, vals, params)
    syms x

    k = length(params)

    printf("Base canonica:\n");

    for index = 0:k - 1
        x^index
    end

    printf("\n");

    A = [];
    b = [];

    for index = 0:k - 1
        f = x^index

        row = [];

        for i = 1: k
            row(i) = double(subs(diff(f, x, derivatives(i)), vals(i)));
        end

        params .* row

        A(index + 1, :) = row;

        integral = int(f, x, low, high)
        b(index + 1, 1) = double(integral);

        printf("\n");

    end

    A, b

    gq = A \ b;

end
