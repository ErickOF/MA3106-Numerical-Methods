% [Simple Rectangle Rule, Composite Rectangle Rule]
function [srr, crr] = RectangleRule(x0, xn, n, func)
    srr = (xn - x0) * func((xn + x0) / 2);

    h = (xn - x0) / n
    crr = 0;

    for index = 0:n - 1
        xi = x0 + h * index;
        xi_1 = x0 + h * (index + 1);

        fx = func((xi + xi_1) / 2);

        printf("i = %d, xi = %f, xi+1 = %f, f((xi + xi+1) / 2) = %f\n",
                index, xi, xi_1, fx);

        crr += fx;
    end

    crr *= h;

    return;
end
