clear;
clc;

pkg load symbolic;

syms x y;

warning('off', 'all');

func = 1 + y / x
y0 = 2

a = 1
b = 2
n = 4

[M] = RK4_Met(a, b, y0, func, n)
