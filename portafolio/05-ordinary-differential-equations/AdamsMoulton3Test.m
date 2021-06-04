f = @(t, y) t .* e.^(3 .* t) - 2 .* y

a = 0
b = 1
n = 8

w = [0 0.009423673823601 0.04640858090701536 0.1293611420693127 0.2891624846868167 0.5759913044142537 1.070369759977634 1.900250788108631, 3.267409118296889]

[w] = AdamsMoulton3(f, a, b, n, w)

x = linspace(a, b, n + 1);
sol = @(x) 1 / 25 .* e.^(-2 .* x) .* (e.^(5 .* x) .* (5 .* x - 1) + 1)


figure(1)

plot(x, w);
legend('Approx');

hold on

plot(x, sol(x));
legend('Solution');
hold off

figure(2)

plot(x, abs(sol(x) - w));
title('Error');
