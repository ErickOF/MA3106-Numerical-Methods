function [yApprox] = EulerMethod(func, y0, a, b, n)
    yApprox = [y0];

    h = (b - a) / n

    for i = 1:n
        ti = a + h * i
        approx = yApprox(i) + h * func(ti, yApprox(i))
        yApprox(i + 1) = approx;
    end

end
