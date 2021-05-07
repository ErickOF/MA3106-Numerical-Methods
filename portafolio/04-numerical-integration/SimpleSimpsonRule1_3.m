% Simple Simpson Rule 1/3
function [approx] = SimpleSimpsonRule1_3(x0, x1, x2, func)
    h = (x2 - x0) / 2

    fx0 = func(x0)
    fx1 = func(x1)
    fx2 = func(x2)

    approx = h * (fx0 + 4 * fx1 + fx2) / 3;
end
