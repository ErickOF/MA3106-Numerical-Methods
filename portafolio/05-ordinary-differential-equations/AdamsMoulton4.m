function [w] = AdamsMoulton4(f, a, b, n, w)
    h = (b - a) / n

    for i = 4:n
        xi_3 = a + h * (i - 4);
        xi_2 = a + h * (i - 3);
        xi_1 = a + h * (i - 2);
        xi = a + h * (i - 1);
        xiplus1 = a + h * i;

        printf("\nPara i = %d\n", i - 1);
        printf("t%d = %f\n", i - 4, xi_3);
        printf("t%d = %f\n", i - 3, xi_2);
        printf("t%d = %f\n", i - 2, xi_1);
        printf("t%d = %f\n", i - 1, xi);
        printf("t%d = %f\n", i, xiplus1);

        printf("w%d = %f\n", i - 4, w(i - 3));
        printf("w%d = %f\n", i - 3, w(i - 2));
        printf("w%d = %f\n", i - 2, w(i - 1));
        printf("w%d = %f\n", i - 1, w(i));
        printf("w%d = %f\n", i, w(i + 1));

        w(i + 1) = w(i) + h * (251 * f(xiplus1, w(i + 1)) + 646 * f(xi, w(i)) - 264 * f(xi_1, w(i - 1)) + 106 * f(xi_2, w(i - 2)) - 19 * f(xi_3, w(i - 3))) / 720;

        printf("Nuevo w%d = %f\n", i, w(i + 1));
    end

end
