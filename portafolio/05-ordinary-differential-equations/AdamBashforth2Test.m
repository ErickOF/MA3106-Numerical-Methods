clear;
clc;

func = @(t, y) 1 + y / t

a = 1
b = 2
n = 4

w0 = 0
w1 = 1

[resultTable] = AdamBashforth2(func, a, b, n, w0, w1)
