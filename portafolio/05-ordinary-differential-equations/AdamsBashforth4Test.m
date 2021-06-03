clear;
clc;

func = @(t, y) (t.^2 + y.^2) / (1 + t + y.^2)

a = 0
b = 5
n = 9

w0 = 0
w1 = 0.040829243118682
w2 = 0.256787182681211
w3 = 0.712675460749765

[resultTable] = AdamsBashforth4(func, a, b, n, w0, w1, w2, w3)
