a = 0
b = 16
k = 5

func = @(x) (x^3 - 6*x) / (x^2 + 3)

[approx] = RombergRule(func, a, b, k)
