syms x

ezPlot1 = ezplot(x * cos(x) + x^2 - 1 / x, [1, 6]);

title('f(x) = xcos(x) + x^2 - 1/x');
xlabel('Eje x');
ylabel('Eje y');

set(ezPlot1, 'color', [1 0 0]);

grid on;
