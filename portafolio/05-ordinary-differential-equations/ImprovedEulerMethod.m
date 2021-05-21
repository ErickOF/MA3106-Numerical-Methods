function [yApprox] = ImprovedEulerMethod(func, y0, a, b, n)
    yApprox = [y0];
    h = (b - a) / n

    for i = 1:n
        ti = a + h * (i - 1)
        ti_1 = a + h * i
        yi = yApprox(i)
        approx = yi + h * (func(ti, yi) + func(ti_1, yi + h * func(ti, yi))) / 2

        yApprox(i + 1) = approx;
    end

end
