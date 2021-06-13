function [W] = eulerMet(a, b, h, Y0)
    n = (b - a) / h;

    W = Y0;

    for i = 1:n
        W(i + 1, :) = W(i, 1) + h * func1(W(i, 1), W(i, 2));
    end

end
