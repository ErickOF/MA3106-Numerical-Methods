func = @(x, y) 1 + y / x

y0 = 2

a = 1
b = 2
n = 4

[yApprox] = RungeKutta4(func, y0, a, b, n)

x = linspace(a, b, n + 1);
sol = @(x) x .* (log(x) .+ 2)


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
