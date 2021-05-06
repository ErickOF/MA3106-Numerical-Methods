% Composite Simpson Rule 1/2
function [approx] = CompositeSimpsonRule1_3(a, b, n, func)
    h = (b - a) / n

    fx0 = func(a)

    mult4 = 0;

    for index = 1:n / 2
        k = 2 * index - 1;
        xi = a + k * h;
        fxi = func(xi);

        printf("i = %d, x_%d = %f, f(x_%d) = f(x_%d) = %f\n", k, k, xi, k, xi, fxi);

        mult4 += fxi;
    end

    printf("Suma = %f\n", mult4);

    mult2 = 0;

    for index = 1:n / 2 - 1
        k = 2 * index;
        xi = a + k * h;
        fxi = func(xi);

        printf("i = %d, x_%d = %f, f(x_%d) = f(x_%d) = %f\n", k, k, xi, k, xi, fxi);

        mult2 += fxi;
    end

    printf("Suma = %f\n", mult2);

    fxn = func(b)

    approx = h * (fx0 + 4 * mult4 + 2 * mult2 + fxn) / 3;
end
