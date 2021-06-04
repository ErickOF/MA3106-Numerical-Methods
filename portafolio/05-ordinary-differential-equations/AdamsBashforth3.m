function [resultTable] = AdamsBashforth3(f, a, b, n, w0, w1, w2)
    h = (b - a) / n

    resultTable(1, :) = [0, a, w0];
    resultTable(2, :) = [1, a + h, w1];
    resultTable(3, :) = [2, a + 2 * h, w2];

    for i = 3:n
        ti_2 = a + h * (i - 3);
        ti_1 = a + h * (i - 2);
        ti = a + h * (i - 1);

        wi_2 = resultTable(i - 2, 3);
        wi_1 = resultTable(i - 1, 3);
        wi = resultTable(i, 3);

        fti_2wi_2 = f(ti_2, wi_2);
        fti_1wi_1 = f(ti_1, wi_1);
        ftiwi = f(ti, wi);

        wiplus1 = wi + h * (23 * ftiwi - 16 * fti_1wi_1 + 5 * fti_2wi_2) / 12;

        printf("\nPara i = %d\n", i - 1);
        printf("t%d = %f\n", i - 3, ti_2);
        printf("t%d = %f\n", i - 2, ti_1);
        printf("t%d = %f\n", i - 1, ti);
        printf("w%d = %f\n", i - 3, wi_2);
        printf("w%d = %f\n", i - 2, wi_1);
        printf("w%d = %f\n", i - 1, wi);
        printf("f(t%d, w%d) = %f\n", i - 3, i - 3, fti_2wi_2);
        printf("f(t%d, w%d) = %f\n", i - 2, i - 2, fti_1wi_1);
        printf("f(t%d, w%d) = %f\n", i - 1, i - 1, ftiwi);
        printf("w%d = %f\n", i, wiplus1);

        resultTable(i + 1, 1) = i;
        resultTable(i + 1, 2) = ti + h;
        resultTable(i + 1, 3) = wiplus1;
    end

end
