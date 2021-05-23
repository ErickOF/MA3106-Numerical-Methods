% Runge-Kutta 4
function [yApprox] = RungeKutta4(func, y0, a, b, n)
    h = (b - a) / n

    yApprox = [y0]

    for i = 1:n
        xi = a + h * (i - 1)
        xi_1 = xi + h

        yi = yApprox(i)

        k1 = h * func(xi, yi)
        k2 = h * func(xi + h / 2, yi + k1 / 2)
        k3 = h * func(xi + h / 2, yi + k2 / 2)
        k4 = h * func(xi_1, yi + k3)

        approx = yi + (k1 + 2 * k2 + 2 * k3 + k4) / 6
        yApprox(i + 1) = approx;
    end

end
