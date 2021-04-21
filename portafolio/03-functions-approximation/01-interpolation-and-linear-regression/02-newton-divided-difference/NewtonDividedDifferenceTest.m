clear;
clc;

format rat;

warning('off', 'all');

% Only when running on PC
pkg load symbolic;

syms x

x0 = [1 2 4]
y0 = [0 1 2]

[Pn, solTable] = NewtonDividedDifference(x, x0, y0);

solTable
vpa(Pn, 5)

xApprox = 3
double(subs(Pn, x, xApprox))
