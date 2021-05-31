func = @(t, y) y .* e.^(2 .* t)

a = 1
b = 2
y0 = 1
n = 5

[yApprox] = EulerMethod(func, y0, a, b, n)

x = linspace(a, b, n + 1);
sol = @(x) 1 / 25 .* e.^(-2 .* x) .* (e.^(5 .* x) .* (5 .* x - 1) + 1)

figure(1)

plot(x, yApprox);
legend('Approx');

hold on

plot(x, sol(x));
legend('Solution');
hold off

figure(2)

plot(x, sol(x) - yApprox);
title('Error');
hold off
