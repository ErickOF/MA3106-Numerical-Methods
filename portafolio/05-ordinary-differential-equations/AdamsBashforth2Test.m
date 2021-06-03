clear;
clc;

func = @(t, y) y .* e.^(2 . * t)

a = 1
b = 2
n = 5

w0 = 0
w1 = 1

[resultTable] = AdamsBashforth2(func, a, b, n, w0, w1)
