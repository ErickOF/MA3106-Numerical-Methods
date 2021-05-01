function [f] = func_cubica(a, b, c, d, p1, p2)
    syms x;
    f = a * ((x - p1)^3) + b * ((p2 - x)^3) + c * (x - p1) + d * (p2 - x);
end
