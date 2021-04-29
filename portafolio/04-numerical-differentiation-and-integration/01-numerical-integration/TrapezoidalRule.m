% Simple Trapezoidal Rule, Composite Trapezoidal Rule
function [str, ctr] = TrapezoidalRule(x0, xn, n, func)
    printf("Simple Trapezoidal Rule:\n");
    str = (xn - x0) * (func(xn) + func(x0)) / 2

    printf("\nComposite Trapezoidal Rule: \n");
    ctr = 0;

    h = (xn - x0) / n

    fx0 = func(x0);
    printf("f(x0) = f(%f) = %f\n", x0, fx0);

    for index = 1:n - 1
        xi = x0 + h * index;
        fxi = func(xi);
        ctr += fxi;

        printf("f(x%d) = f(%f) = %f\n", index, xi, fxi);
    end

    fxn = func(xn);
    printf("f(x%d) = f(%f) = %f\n", n, xn, fxn);

    ctr = h * (fx0 + 2 * ctr + fxn) / 2;
    printf("Result = %f\n", ctr);
end
