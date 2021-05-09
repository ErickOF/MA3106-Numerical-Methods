% Composite Simpson Rule 3/8
function [approx] = CompositeSimpsonRule3_8(a, b, n, func)
    h = (b - a) / n

    fx0 = func(a)

    mult3 = 0;

    for index = 1:n - 1
        if (mod(index, 3 ) != 0)
            xi = a + index * h;
            fxi = func(xi);

            printf("i = %d, x_%d = %f, f(x_%d) = f(%f) = %f\n", index, index, xi, index, xi, fxi);

            mult3 += fxi;
        end
    end

    printf("Suma = %f\n", mult3);

    mult2 = 0;

    for index = 1:n / 3
        k = 3 * index;
        xi = a + k * h;
        fxi = func(xi);

        printf("i = %d, x_%d = %f, f(x_%d) = f(%f) = %f\n", k, k, xi, k, xi, fxi);

        mult2 += fxi;
    end

    printf("Suma = %f\n", mult2);

    fxn = func(b)

    approx = 3 * h * (fx0 + 3 * mult3 + 2 * mult2 + fxn) / 8;
end
