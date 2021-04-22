clear;
clc;

format long g;

x = [1 2 3 4 5 6 7]
y = [2.31 2.01 1.80 1.66 1.55 1.47 1.41]

printf("Columnas: x, x^2, x^3, x^4, y, xy, xy^2\n");
[solTable, a, b, c] = MSEParabola(x, y)

xApprox = [3.5, 9]
yApprox = a + b * xApprox + c * xApprox.^2
