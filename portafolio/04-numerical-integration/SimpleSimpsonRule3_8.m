% Simple Simpson Rule 3/8
function [approx] = SimpleSimpsonRule3_8(x0, x1, x2, x3, func)
    h = (x3 - x0) / 3

    fx0 = func(x0)
    fx1 = func(x1)
    fx2 = func(x2)
    fx3 = func(x3)

    approx = 3 * h * (fx0 + 3 * fx1 + 3 * fx2 + fx3) / 8
end
