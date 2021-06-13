function [W] = eulerMet(f, a, b, n, Y0)
    h = (b - a) / n;

    W = Y0;

    for i = 1:n
        W(i + 1, :) = W(i, 1) + h * f(W(i, 1), W(i, 2));
    end

end
