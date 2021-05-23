% Runge-Kutta 2
function [yApprox] = RungeKutta2(func, y0, a, b, n)
    h = (b - a) / n
    yApprox = [y0]

    for i = 1:n
        xi = a + h * (i - 1)
        xi_1 = xi + h
        yi = yApprox(i)

        k1 = h * func(xi, yi)
        k2 = h * func(xi_1, yi + k1)
        approx = yi + (k1 + k2) / 2

        yApprox(i + 1) = approx;
    end

end
