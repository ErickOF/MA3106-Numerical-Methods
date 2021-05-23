function [M] = RK4_Met(a, b, f, n)
    syms x y;

    w = 2;
    h = (b - a) / n;
    t = a;
    M = zeros(n, 2);

    for i = 1:n
        k1 = h * subs(f, [x y], [t w]);
        k2 = h * subs(f, [x, y], [t + h / 2, w + k1 / 2]);
        k3 = h * subs(f, [x, y], [t + h / 2, w + k2 / 2]);
        k4 = h * subs(f, [x y], [t + h, w + k3]);

        w = w + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
        t = a + h * i;

        M(i, 1) = double(t);
        M(i, 2) = double(w);
    end

end
