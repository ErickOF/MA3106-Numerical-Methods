function [resultTable] = AdamsMoulton2(f, a, b, n, w0, w1)
    syms wiplus1 wi wi_1 tiplus1 ti ti_1 x y

    h = (b - a) / n

    % Adams-Moulton 2 equation
    am = wi + h * (5 * subs(f, {x y}, [tiplus1 wiplus1]) + 8 * subs(f, {x y}, [ti wi]) - subs(f, {x y}, [ti_1 wi_1])) / 12

    % Get wi+1
    wiplus1 = solve(wiplus1 == am, wiplus1)

    resultTable(1, :) = [0, a, w0];
    resultTable(2, :) = [1, a + h, w1];

    for i = 2:n
        xi_1 = a + h * (i - 1);
        xi = a + h * i;
        xiplus1 = a + h * (i + 1);

        printf("t%d = %f\n", i - 1, xi_1);
        printf("t%d = %f\n", i, xi);
        printf("t%d = %f\n", i + 1, xiplus1);
        printf("w%d = %f\n", i - 1, resultTable(i - 1, 3));
        printf("w%d = %f\n", i, resultTable(i, 3));

        result = double(subs(wiplus1, {ti_1 ti tiplus1 wi_1 wi}, [xi_1 xi xiplus1 resultTable(i - 1, 3) resultTable(i, 3)]));

        printf("w%d = %f\n\n", i + 1, result);

        resultTable(i + 1, :) = [i, xi, result];
    end

end
