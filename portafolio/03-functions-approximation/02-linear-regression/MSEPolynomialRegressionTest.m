clear;
clc;

format long g;

x = [0 5 10 15 20]
y = [100 212 448 949 2009]

[solTable, a, b] = MSEPolynomialRegression(x, y);

printf("Columnas: ln(x), ln(x)^2, ln(y), ln(x)ln(y)\n");
solTable, a, b

xApprox = [25]
yApprox = a .* e.^(b .* xApprox)
