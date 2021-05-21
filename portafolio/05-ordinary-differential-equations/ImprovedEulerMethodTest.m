func = @(x, y) 2 * x * y
a = 1
b = 2
x0 = 3
n = 3

[yApprox] = ImprovedEulerMethod(func, x0, a, b, n)

plot(a:(b - a) / n:b, yApprox)
