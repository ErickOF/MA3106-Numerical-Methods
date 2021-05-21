func = @(t, q) 1/3 - q / 6
a = 0
b = 30
q0 = 0
n = 3

[yApprox] = EulerMethod(func, q0, a, b, n)

plot(a:(b - a) / n:b, yApprox)
