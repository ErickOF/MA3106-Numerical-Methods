x0 = 0
xn = 2
n = 5
func = @(x) e^(-x^2)

[str, ctr] = TrapezoidalRule(x0, xn, n, func);
