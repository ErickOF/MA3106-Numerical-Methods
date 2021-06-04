clear;
clc;

f = @(t, y) t .* e.^(3 .* t) - 2 .* y

a = 0
b = 1
n = 8

w0 = 0
w1 = 0.009423673823601411
w2 = 0.04565455859051942

[resultTable] = AdamsBashforth3(func, a, b, n, w0, w1, w2)


x = linspace(a, b, n + 1);
sol = @(x) 1 / 25 .* e.^(-2 .* x) .* (e.^(5 .* x) .* (5 .* x - 1) + 1)


figure(1)

plot(x, resultTable(:, 3)');
legend('Approx');

hold on

plot(x, sol(x));
legend('Solution');
hold off

figure(2)

plot(x, sol(x) - resultTable(:, 3)');
title('Error');
hold off
