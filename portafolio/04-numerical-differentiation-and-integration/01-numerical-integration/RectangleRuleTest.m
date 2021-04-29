x0 = 3
xn = 4
n = 5
func = @(x) cos(x) / x^2

printf("Simple Rectangle Rule, Composite Rectangle Rule");
[srr, crr] = RectangleRule(x0, xn, n, func)
