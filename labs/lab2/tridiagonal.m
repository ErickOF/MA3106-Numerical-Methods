% Tridiagonal function
function A = tridiagonal(n)

    A = zeros(n);

    for i = 1:n

        for j = 1:n

            if i + 1 == j
                A(i, j) = 1;
            elseif i == j
                A(i, j) = 4;
            elseif i == j + 1
                A(i, j) = 1;
            end

        end

    end

    A(1, 1) = 1;
    A(end, end) = 1;
    A(1, 2) = 0;
    A(end, end - 1) = 0;

end
