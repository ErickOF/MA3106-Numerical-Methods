function [w] = AdamsMoulton2(f, a, b, n, w)
    h = (b - a) / n

    for i = 4:n
        xi_1 = a + h * (i - 2);
        xi = a + h * (i - 1);
        xiplus1 = a + h * i;

        printf("\nPara i = %d\n", i - 1);
        printf("t%d = %f\n", i - 2, xi_1);
        printf("t%d = %f\n", i - 1, xi);
        printf("t%d = %f\n", i, xiplus1);

        printf("w%d = %f\n", i - 2, w(i - 1));
        printf("w%d = %f\n", i - 1, w(i));
        printf("w%d = %f\n", i, w(i + 1));

        w(i + 1) = w(i) + h * (5 * f(xiplus1, w(i + 1)) + 8 * f(xi, w(i)) - f(xi_1, w(i - 1))) / 12;

        printf("Nuevo w%d = %f\n", i, w(i + 1));
    end

end
