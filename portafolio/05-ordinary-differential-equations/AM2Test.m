clear;
clc;

warning('off', 'all');

syms x y

f = 1 + y / x

a = 1
b = 2
n = 5

w0 = 2
w1 = 2.616666666666666666666666666666666667

[resultTable] = AM2(f, a, b, n, w0, w1)
