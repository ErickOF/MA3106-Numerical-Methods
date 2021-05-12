% Regla del Trapecio
function [I] = TrapecioReg(f, a, b, n)
    h = (b - a) / n;

    x = a:h:b;

    I = h * (f(a) + 2 * sum(f(x(2:end - 1))) + f(b)) / 2;
end
