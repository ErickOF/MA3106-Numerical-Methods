clear;
clc;

format long g;

x = [10.50 29.49 42.70 60.01 75.51 91.05]
y = [10.421 10.939 11.321 11.784 12.242 12.668]

printf("Columnas: x, x^2, y, xy\n");
[solTable, m, b] = MSELinearRegression(x, y)

xApprox = [70, 100]
yApprox = m * xApprox + b
