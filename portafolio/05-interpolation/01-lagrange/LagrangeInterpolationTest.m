clear;
clc;

format rat;

warning('off', 'all');

% Only when running on PC
pkg load symbolic;

syms x

x0 = [1/4 1/2 1 4 8]
y0 = [-2 -1 0 2 3]

Pn = LagrangeInterpolation(x, x0, y0)

xApprox = 3
double(subs(Pn, x, xApprox))
