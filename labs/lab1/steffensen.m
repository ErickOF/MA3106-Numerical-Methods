function [dk, k, err] = steffensen(d0, tol, iterMax)
    dk = d0;
    k = 0;
    err = inf;

    while (k < iterMax && err > tol)
        fd0 = func(d0);
        dk = d0 - fd0^2 / (func(d0 + fd0) - fd0);

        err = abs(func(dk));

        d0 = dk;
        k += 1;
    end
end
