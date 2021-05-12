% Regla del rectangulo
function [I] = RectanguloReg(f, a, b, n)
    h = (b - a) / n;

    x = a:h:b;

    I = h * sum(f((x(1:end - 1) + x(2:end)) / 2));
end
