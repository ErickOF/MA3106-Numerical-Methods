clear;
clc;

func = @(t, y) 1 + y / t

a = 1
b = 2
n = 5

w0 = 2
w1 = 2.618779
w2 = 3.271049
w3 = 3.95199

[resultTable] = AdamBashforth4(func, a, b, n, w0, w1, w2, w3)
