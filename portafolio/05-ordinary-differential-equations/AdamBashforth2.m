function [resultTable] = AdamBashforth2(f, a, b, n, w0, w1)
    h = (b - a) / n

    resultTable(1, :) = [0, a, w0];
    resultTable(2, :) = [1, a + h, w1];

    for i = 2:n
        ti_1 = a + h * (i - 2);
        ti = a + h * (i - 1);

        wi_1 = resultTable(i - 1, 3);
        wi = resultTable(i, 3);

        fti_1wi_1 = f(ti_1, wi_1);
        ftiwi = f(ti, wi);

        printf("\nPara i = %d\n", i - 1);
        printf("t%d = %f\n", i - 2, ti_1);
        printf("t%d = %f\n", i - 1, ti);
        printf("w%d = %f\n", i - 2, wi_1);
        printf("w%d = %f\n", i - 1, wi);
        printf("f(t%d, w%d) = %f\n", i - 2, i - 2, fti_1wi_1);
        printf("f(t%d, w%d) = %f\n", i - 1, i - 1, ftiwi);

        resultTable(i + 1, 1) = i;
        resultTable(i + 1, 2) = ti + h;
        resultTable(i + 1, 3) = wi + h * (3 * ftiwi - fti_1wi_1) / 2;

    end

end
