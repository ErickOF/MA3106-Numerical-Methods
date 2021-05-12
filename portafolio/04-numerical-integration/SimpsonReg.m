% Regla de Simpson
function [I] = SimpsonReg(f, a, b, n)
    h = (b - a) / n;
    x = a:h:b;

    I = h * (f(a) + 4 * sum(f(x(2:2:n))) + 2 * sum(f(x(3:2:n))) + f(b)) / 3;
end
