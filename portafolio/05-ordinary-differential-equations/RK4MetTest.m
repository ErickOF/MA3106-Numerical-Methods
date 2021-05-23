clear;
clc;

syms x y;

warning('off', 'all');

func = 1 + y / x

a = 1
b = 2
n = 4

[M] = RK4_Met(a, b, func, n)
