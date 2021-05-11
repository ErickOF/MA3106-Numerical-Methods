function [approx] = RombergRule(func, a, b, k)
    approx = [];

    for index = 0:k - 1
        n = 2^index

        [_, ctr] = TrapezoidalRule(a, b, n, func);
        approx(end + 1, 1) = ctr;
    end

    for j = 2:k

        for i = j - 1:k - 1
            approx(i + 1, j) = (4^(j - 1) * approx(i + 1, j - 1) - approx(i, j - 1)) / (4^(j - 1) - 1);
            printf("Usando k = %d, I(j+1, k-1) = %f, I(j, k-1) = %f, I(j, k) = %f\n",
                    j, approx(i + 1, j - 1), approx(i, j - 1), approx(i + 1, j));
        end

    end

end
