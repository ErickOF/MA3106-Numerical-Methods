clear;
clc;
clf;
close;


func = @(A, B) [-24 * A * B; -24 * A * B.^2]

a = 0
b = 1
n = 99

Y0 = [1 1]

[W] = eulerMet(func, a, b, n, Y0)

xn = linspace(a, b, n + 1);


hold on;
plot(xn, W(:, 1))
plot(xn, W(:, 2))
hold off;
