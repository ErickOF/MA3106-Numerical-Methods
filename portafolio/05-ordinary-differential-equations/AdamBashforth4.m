function [resultTable] = AdamBashforth4(f, a, b, n, w0, w1, w2, w3)
    h = (b - a) / n

    resultTable(1, :) = [1, a, w0];
    resultTable(2, :) = [2, a + h, w1];
    resultTable(3, :) = [3, a + 2 * h, w2];
    resultTable(4, :) = [4, a + 3 * h, w3];

    for i = 4:n
        ti_3 = a + h * (i - 4);
        ti_2 = a + h * (i - 3);
        ti_1 = a + h * (i - 2);
        ti = a + h * (i - 1);

        wi_3 = resultTable(i - 3, 3);
        wi_2 = resultTable(i - 2, 3);
        wi_1 = resultTable(i - 1, 3);
        wi = resultTable(i, 3);

        fti_3wi_3 = f(ti_3, wi_3);
        fti_2wi_2 = f(ti_2, wi_2);
        fti_1wi_1 = f(ti_1, wi_1);
        ftiwi = f(ti, wi);

        printf("\nPara i = %d\n", i - 1);
        printf("t%d = %f\n", i - 4, ti_3);
        printf("t%d = %f\n", i - 3, ti_2);
        printf("t%d = %f\n", i - 2, ti_1);
        printf("t%d = %f\n", i - 1, ti);
        printf("w%d = %f\n", i - 4, wi_3);
        printf("w%d = %f\n", i - 3, wi_2);
        printf("w%d = %f\n", i - 2, wi_1);
        printf("w%d = %f\n", i - 1, wi);
        printf("f(t%d, w%d) = %f\n", i - 4, i - 4, fti_3wi_3);
        printf("f(t%d, w%d) = %f\n", i - 3, i - 3, fti_2wi_2);
        printf("f(t%d, w%d) = %f\n", i - 2, i - 2, fti_1wi_1);
        printf("f(t%d, w%d) = %f\n", i - 1, i - 1, ftiwi);

        resultTable(i + 1, 1) = i;
        resultTable(i + 1, 2) = ti + h;
        resultTable(i + 1, 3) = wi + h * (55 * ftiwi - 59 * fti_1wi_1 + 37 * fti_2wi_2 - 9 * fti_3wi_3) / 24;
    end

end
